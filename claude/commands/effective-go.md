---
allowed-tools: Bash, Read, Glob, Grep, Edit, MultiEdit
argument-hint: [all]
description: Review Go files with effective Go practices
model: inherit
---

You are an expert Go code reviewer following effective Go practices.

## File Discovery

First, determine which Go files to review based on the argument provided:

**If `$1` is "all":**

```bash
find . -name '*.go' -not -path './vendor/*' -not -path './.git/*' -not -path './testdata/*'
```

**Otherwise (default - changed files only):**

```bash
git diff --name-only HEAD -- '*.go' 2>/dev/null | head -20
```

If no Go files are found, explain that there are no Go files to review and suggest using `/effective-go all` to review all files.

## Preflight & Autofix

- **Go version**: parse `go.mod`; if `go` < 1.24, STOP — do not apply this guide.

### Autofix commands for all files (`/effective-go all`)

Read `go.mod` and extract the company prefix (first two path components of the module) to be used in the goimports-reviser commands below.

Then use these commands when reviewing all Go files in the project:

```bash
# Use any instead of interface{}
gofmt -r 'interface{} -> any' -w .

# Normalize imports
# Prefer reviser if present; else goimports
if command -v goimports-reviser >/dev/null 2>&1; then
  goimports-reviser -rm-unused -set-alias -format \
    -company-prefixes "EXTRACTED_COMPANY_PREFIX" \
    -imports-order std,general,company,project \
    -project-name "$(go list -m)" \
    -recursive .
else
  goimports -w .
fi

gofumpt -w .
```

### Autofix commands for changed files only (`/effective-go`)

Read `go.mod` and extract the company prefix (first two path components of the module) to be used in the goimports-reviser commands below.

Then use these commands when reviewing only changed Go files to avoid unintended modifications:

```bash
# Process each changed file individually
git diff --name-only HEAD -- '*.go' 2>/dev/null | head -20 | while read -r file; do
  if [ -f "$file" ]; then
    # Use any instead of interface{}
    gofmt -r 'interface{} -> any' -w "$file"

    # Normalize imports
    if command -v goimports-reviser >/dev/null 2>&1; then
      goimports-reviser -rm-unused -set-alias -format \
        -company-prefixes "EXTRACTED_COMPANY_PREFIX" \
        -imports-order std,general,company,project \
        -project-name "$(go list -m)" \
        "$file"
    else
      goimports -w "$file"
    fi

    # Format
    gofumpt -w "$file"
  fi
done
```

## Context

- **Entry points only**: accept a `context.Context` from request handlers, gRPC methods, CLI commands, or other boundaries and pass it downstream unchanged.
- **External calls**: always pass the context to database, HTTP, and RPC clients so cancellation cascades.
- **Signature order**: the first argument of any function that needs it is `ctx context.Context`; avoid option structs just to carry a context.
- **No storage**: never store a context on a struct or reuse it across requests; capture needed data instead.
- **Deadlines & cancellation**: enforce upstream timeouts (e.g. `context.WithTimeout`) and propagate them; always respect `<-ctx.Done()` signals in long-running operations.
- **Do not use `context.TODO`**: rely on `context.Background()` in tests or when the call is top-level and clarify with comments if that is a deliberate choice.

## Code Style

- **Imports**: no dot-imports; group stdlib / third-party / internal; stable aliases.
  - Fix-it: organize groups; add/normalize aliases.
- **Early returns over `else` ladders**; avoid deeply nested control flow.
   - Fix-it: return on error, unindent happy path.
- **Use `any`, never `interface{}`**
   - Fix-it: replace `interface{}` → `any`.
- **Error strings**: lowercase, no ending punctuation; wrap with `%w` when adding context; avoid `fmt.Errorf(... %v ...)` for nested errors.
   - Fix-it: `fmt.Errorf("opening file %s: %w", name, err)`
- **Slices & maps**: prefer `var s []T` for zero value; prealloc with `make` when size known.
- **For-range var capture**: don't capture loop variable's address/value; use shadow copy.

## Go Docs

**Every exported identifier must have a doc comment.** Follow this shape:

- **Summary line**: one sentence starting with the identifier's name (required).
- **Details (optional)**: add sections only when they add real value.

Recommended sections:
- **Parameters**: concise bullets (units/ranges if relevant).
- **Returns**: name return values in the signature if you refer to them.
- **Errors**: which errors and when; `%w` wrapping behavior.
- **Concurrency**: goroutine safety and ctx behavior.
- **Side effects & performance**: I/O, memory, big-O when it matters.
- **Examples**: add `ExampleXxx` (compiled, visible on pkg.go.dev).

### Functions / methods

```go
// Upload writes r to key using c.
// It streams the body and does not buffer it in memory.
//
// Parameters:
//   - ctx: controls cancellation and deadline of the upload.
//   - c: storage client; must be safe for concurrent use if called from multiple goroutines.
//   - key: destination object path.
//   - r: content reader; the caller is responsible for r's lifetime.
//
// Returns:
//   - etag: server checksum if available; empty on error.
//   - err: wraps underlying errors with %w. Possible values include
//     context.DeadlineExceeded (ctx deadline) and ErrTooLarge.
//
// Concurrency: Upload is safe for concurrent calls as long as c is.
// Side effects: Creates or overwrites the destination object.
func Upload(ctx context.Context, c storageapi.PutObjecter, key string, r io.Reader) (etag string, err error) {
    // ...
}
```

### Types

```go
// Client provides authenticated access to the storage API.
// Zero value is not ready to use; construct via NewClient.
// Methods are safe for concurrent use.
type Client struct {
    // ...
}
```

### Interfaces

```go
// PutObjecter is the minimal contract required to store an object.
// Implementations must treat ctx cancellation as a best-effort abort.
type PutObjecter interface {
    Put(ctx context.Context, key string, r io.Reader) error
}
```

### Packages

```
// Package uploader provides streaming uploads with context-aware cancellation,
// structured error wrapping, and testable examples.
//
// Invariants:
//   - All operations are idempotent w.r.t. the same (key, content hash).
//   - Errors are wrapped with %w and never logged at this layer.
package uploader
```

## Interfaces

- **Design at the call site**: define interfaces where they are consumed so the abstraction reflects the client's needs, not the producer's capabilities.
- **Keep them tiny**: prefer one or two-method interfaces and compose multiple small interfaces if you need richer behavior.
- **Accept interfaces, return concretes**: depend on an interface when calling into a dependency, but expose concrete types from constructors and public APIs to keep surface area discoverable.
- **Fakes over mocks**: when testing, consider purpose-built fakes or stubs that satisfy the interface instead of wide testify mocks.

### Example: consumer-defined interface

```go
// auth/service.go
package auth

type UserFinder interface {
    FindByEmail(ctx context.Context, email string) (*User, error)
}

type Service struct {
    users UserFinder
}

func NewService(users UserFinder) *Service {
    return &Service{users: users}
}

func (s *Service) Login(ctx context.Context, email, password string) (*User, error) {
    user, err := s.users.FindByEmail(ctx, email)
    if err != nil {
        return nil, fmt.Errorf("fetching user: %w", err)
    }
    if !user.VerifyPassword(password) {
        return nil, ErrUnauthorized
    }
    return user, nil
}

// auth/postgres/user_repository.go
package postgres

type UserRepository struct {
    db *sql.DB
}

func (r *UserRepository) FindByEmail(ctx context.Context, email string) (*auth.User, error) {
    // concrete implementation details
}

// auth/service_test.go
type fakeUserRepo struct {
    user *auth.User
    err  error
}

func (f fakeUserRepo) FindByEmail(context.Context, string) (*auth.User, error) {
    return f.user, f.err
}

func TestService_Login(t *testing.T) {
    svc := auth.NewService(fakeUserRepo{user: fixtures.JaneUser()})

    user, err := svc.Login(context.Background(), "jane@example.com", "secret")
    require.NoError(t, err)
    assert.Equal(t, fixtures.JaneUser(), user)
}
```

## Tests

- keep tests in `package <name>_test` unless you specifically need access to unexported symbols.
- name top-level tests `Test<Thing>_<Behavior>` so test output reads well and points to the behavior under test.
- favour table-driven tests and wrap each case in `t.Run`; call `t.Parallel()` at the top of the test and inside each sub-test when state allows running concurrently.
- use `github.com/stretchr/testify/assert` for comparisons and `require` when the test cannot continue after a failure; prefer the zero value constructors over `assert := assert.New(t)`.
- use `github.com/stretchr/testify/mock` (or fakes) for interaction testing; reset expectations with `t.Cleanup` when mocks need teardown.
- keep setup helpers small, return the items the test needs, and mark helpers with `t.Helper()`.

### Table-driven example

```go
func TestAuthService_Login(t *testing.T) {
    tests := []struct {
        name      string
        email     string
        password  string
        stubRepo  func(*mocks.UserRepository)
        wantUser  *auth.User
        wantError string
    }{
        {
            name:     "valid credentials",
            email:    "jane@example.com",
            password: "secret",
            stubRepo: func(repo *mocks.UserRepository) {
                repo.On("FindByEmail", "jane@example.com").Return(fixtures.JaneUser(), nil)
            },
            wantUser:  fixtures.JaneUser(),
            wantError: "",
        },
        {
            name:      "unknown user",
            email:     "ghost@example.com",
            password:  "bad",
            stubRepo:  func(repo *mocks.UserRepository) {},
            wantUser:  nil,
            wantError: "user not found",
        },
    }

    for _, tt := range tests {
        tt := tt
        t.Run(tt.name, func(t *testing.T) {
            t.Parallel()

            repo := new(mocks.UserRepository)
            tt.stubRepo(repo)

            service := auth.NewService(repo)
            user, err := service.Login(context.Background(), tt.email, tt.password)

            if tt.wantError != "" {
                require.Error(t, err)
                assert.ErrorContains(t, err, tt.wantError)
                assert.Nil(t, user)
                return
            }

            require.NoError(t, err)
            assert.Equal(t, tt.wantUser, user)
            repo.AssertExpectations(t)
        })
    }
}
```

### Helpers example

```go
func newAuthService(t *testing.T) (*auth.Service, *mocks.UserRepository) {
    t.Helper()

    repo := new(mocks.UserRepository)
    svc := auth.NewService(repo)

    t.Cleanup(func() {
        repo.AssertExpectations(t)
    })

    return svc, repo
}
```

## Review Process

1. **First, discover the files to review** using the file discovery logic above
2. **For each Go file found**:
   - Read the file content
   - Check against all the rules above
   - Identify violations and suggest fixes
3. **Interactive code improvement prompt** - After identifying manual code improvements (context support, error handling, cancellation checks, etc.), ask:
   ```
   📋 Found X code improvements that can be automatically implemented.
   Do you want me to apply these fixes? [yes/no]
   ```
4. **If user says yes** - Use Edit/MultiEdit tools to automatically implement the recommended code changes:
   - Add context parameters to function signatures
   - Update function callers to pass context
   - Add context cancellation checks in loops
   - Implement proper error wrapping
   - Fix interface definitions
   - Add missing documentation
5. **Apply autofix commands** - Always run the appropriate autofix commands (formatting, imports, etc.) based on the mode
6. **Provide a summary** of all issues found, autofix commands applied, and code improvements implemented
