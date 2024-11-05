
S_CORE_DIR="$(dirname ${(%):-%x})"
S_BASE_FILE="$SHELL_DIR/dist/core-base.zsh"
if [[ ! -f "$S_BASE_FILE" ]]; then
    source "$S_CORE_DIR/base/source.zsh"
    source-dir "$S_CORE_DIR/base"
    build-dir "$S_CORE_DIR/base" "$S_BASE_FILE"
fi
source "$S_BASE_FILE"