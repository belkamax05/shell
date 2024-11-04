#? split $PATH into an array, and render them line by line
(
    _pathsAll() {
        local pathArr=(${(s/:/)PATH})
        for p in $pathArr; do
            echo $p
        done
    }
    _pathsAll
    echo-info "Total count:"
    _pathsAll | wc -l
)