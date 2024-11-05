tracing "Init lists"
#? associative array
typeset -gA paths_alias_list
typeset -gA projects_scripts_list

#? indexed array
typeset -ga shell_navigation_list=(
    "$PWD"
)