#? system
if s-not compiled; then
    s-run runtime-create-folders
    s-run plugin-init
    s-run linker all
    s-run runtime-apply-tweaks
    tracing "installing done"
else
    s-run plugin-init
fi

#? plugins
s-run runtime-zap-plugins
s-run runtime-fzf-configure