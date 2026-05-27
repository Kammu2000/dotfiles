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
