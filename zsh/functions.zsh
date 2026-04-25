EMCC_BASE="$HOME/Desktop/adobe-code/repos/acrobatjs/AJS-emcc"

emcc_setup() {
  local version=${1:-5.0.3}   # default = 5.0.3
  source "$EMCC_BASE/$version/emsdk/emsdk_env.sh"
}
