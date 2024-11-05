s-compile() {
    s-run clear dist
    s-run user set PRINT_TIME_NEXT_RUN true
    # s-run build
    s-run reload
}