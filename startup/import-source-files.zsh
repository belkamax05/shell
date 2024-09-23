# for file in $(ls $SHELL_STARTUP_DIR/files | sort); do
#     shell-source $SHELL_STARTUP_DIR/files/$file
# done
for file in $(find "$SHELL_STARTUP_DIR/files" -type f | sort); do
    shell-source "$file"
done