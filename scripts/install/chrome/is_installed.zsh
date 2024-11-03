#? if directory "/etc/opt/chrome" exists, return $CODE_OK, otherwise return $CODE_ERROR
(
    if [ -d "/etc/opt/chrome" ]; then
        return $CODE_OK
    fi
    return $CODE_ERROR
)