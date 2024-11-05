shell-download() {
    local _downloadFrom=$1
    local _downloadTo=$2
    if [ -z "$_downloadFrom" ]; then
        echo-error "Please provide a download link"
        return 1
    fi
    if [ -z "$_downloadTo" ]; then
        echo-error "Please provide a download destination"
        return 1
    fi
    if [ -f "$_downloadTo" ]; then
        echo-warning "$_downloadTo already exists. Overwrite? (y/n)"
        read _overwrite
        if [ "$_overwrite" != "y" ]; then
            return $CODE_ERROR
        fi
    fi
    echo-info "Downloading $_downloadFrom to $_downloadTo"
    curl -fsSL $_downloadFrom -o $_downloadTo
    if [ $? -eq 0 ]; then
        echo-success "Downloaded $_downloadFrom to $_downloadTo"
    else
        echo-error "Failed to download $_downloadFrom to $_downloadTo"
    fi
    # sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    # sudo chmod a+r /etc/apt/keyrings/docker.asc
}