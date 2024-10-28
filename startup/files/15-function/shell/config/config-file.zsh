shell-config-file() {
    _configFileGet() {
        local configFile=$1
        local variableName=$2
        if [ ! -f $configFile ]; then
            echo ""
            return
        fi
        local userValue=$(cat $configFile | grep $variableName | cut -d'=' -f2)
        echo "$userValue"
    }
    _configFileSet() {
        local configFile=$1
        local variableName=$2
        local variableValue=$3

        mkdir -p "$SHELL_SHARED_DIR"
        touch "$configFile"
        # Check if the variable already exists in the file
        if grep -q "^$variableName=" "$configFile"; then
            if s-run is linux; then
                sed -i "s/^$variableName=.*/$variableName=$variableValue/" "$configFile"
            elif s-run is darwin; then
                sed -i '' "s/^$variableName=.*/$variableName=$variableValue/" "$configFile"
            fi
        else
            # Add the new variable
            echo "$variableName=$variableValue" >>"$configFile"
        fi
    }

    case $1 in
        get)
            _configFileGet ${@:2}
            ;;
        set)
            _configFileSet ${@:2}
            ;;
        *)
            echo-error "Invalid '${COLOR_YELLOW}shell-config-file${STYLE_RESET}' command '${COLOR_YELLOW}$1${STYLE_RESET}'."
            ;;
    esac
}