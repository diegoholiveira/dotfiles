# Setup fzf
# ------------------------------------------------------------------------------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi


# Auto-completion
# ------------------------------------------------------------------------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"


# Key bindings
# ------------------------------------------------------------------------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"


# Custom search
# ------------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

_fzf_compgen_path() {
  rg --files --hidden --follow --glob "!.git/*"
}
