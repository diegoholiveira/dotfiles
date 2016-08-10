#!/usr/bin/env bash
# ----------------------------------------------------------------------------
# Helpers to be more productive!
# ----------------------------------------------------------------------------

function find-on-project {
	local STRING="$1"
	find . -type f -print0 | xargs -0 grep -l "${STRING}"
}


function git-branch-clean {
	git branch | grep -v \"master\" | xargs git branch -D
}

