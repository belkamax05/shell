s-pather-get() { #? returns alias or path, based on alias name
    local path=$1
    local pathAlias=$paths_alias_list[$path]
    if [ -z "$pathAlias" ]; then
        echo $path
    else
        echo $pathAlias
    fi
}