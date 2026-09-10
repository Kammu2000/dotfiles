emcc_setup() {
  local version=${1:-5.0.3}

  local root
  root=$(git rev-parse --show-toplevel)

  if [[ -z "$root" ]]; then
    echo "Not in git repo"
    return 1
  fi

  source "$root/AJS-emcc/$version/emsdk/emsdk_env.sh"

  export EMSDK_BIN="$root/AJS-emcc/$version/emsdk/upstream/bin"
  export PATH="$EMSDK_BIN:$PATH"
}

# git related automations

# git branch switch using fzf
gcb() {
    local branch

    branch=$(
        git branch --format='%(refname:short)' |
        fzf \
            --height=50% \
            --prompt='Checkout branch > ' \
            --preview='git log --oneline --decorate -10 {}' \
            --preview-window=right:65%
    )

    [[ -n "$branch" ]] && git checkout "$branch"
}

# multi branch deletion
gbd() {
    local branches

    branches=$(
        git branch --format='%(refname:short)' |
        grep -v "^$(git branch --show-current)$" |
        fzf --multi \
            --height=50% \
            --prompt='Delete branches > ' \
            --preview='git log --oneline --decorate -10 {}' \
            --preview-window=right:65%:wrap
    )

    [[ -n "$branches" ]] && echo "$branches" | xargs git branch -D
}
