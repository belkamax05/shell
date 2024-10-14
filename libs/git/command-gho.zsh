git-command-gho() {
    local file=$1
    local remote=${2:-origin}
    local gr=$(git rev-parse --show-toplevel)

    local branch=$(git rev-parse --abbrev-ref HEAD)
    local url=$(git config --get remote.$remote.url)

    [[ -n $gr && -n $branch && -n $remote ]] || return 1

    local path=${PWD/#$gr/}
    [[ -n $file ]] && path+=/$file

    local a
    IFS=:/ read -A a <<< "$url"
    local len=${#a[@]}
    local user=${a[$len-1]%.git}
    local repo=${a[$len-0]%.git}

    local url="https://github.com/$user/$repo/tree/$branch$path"
    echo $url
    # open $url
}