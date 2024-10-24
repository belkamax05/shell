shell-user() {
    _userGet() {
        local variableName=$1
        if [ ! -f $SHELL_SHARED_DIR/.user-config ]; then
            echo ""
            return
        fi
        local userValue=$(cat $SHELL_SHARED_DIR/.user-config | grep $variableName | cut -d'=' -f2)
        echo "$userValue"
    }
    _userSet() {
        local variableName=$1
        local variableValue=$2
        local envFile="$SHELL_SHARED_DIR/.user-config"

        mkdir -p "$SHELL_SHARED_DIR"
        touch "$envFile"
        # Check if the variable already exists in the file
        if grep -q "^$variableName=" "$envFile"; then
            # Update the existing variable
            sed -i '' "s/^$variableName=.*/$variableName=$variableValue/" "$envFile"
        else
            # Add the new variable
            echo "$variableName=$variableValue" >>"$envFile"
        fi
    }

    case $1 in
    get)
        _userGet ${@:2}
        ;;
    set)
        _userSet ${@:2}
        ;;
    *)
        echo "Invalid '${COLOR_YELLOW}shell-user${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
        ;;
    esac
}
