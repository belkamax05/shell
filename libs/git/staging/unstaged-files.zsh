s-git-unstaged-files() {
    _unstagedFiles=$(git modified-files)
    _newFiles=$(git created-files)
    _allFiles="$_unstagedFiles"$'\n'"$_newFiles"
    #? Remove any empty lines
    _allFiles=$(echo "$_allFiles" | sed '/^$/d')
    echo "$_allFiles"
    return $CODE_OK
}

s-git-unstaged-files-count() {
    s-git unstaged-files | wc -l
    return $CODE_OK
}