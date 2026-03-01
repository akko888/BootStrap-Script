check_language() {

    log_info "CHECKING LANGUAGE"

    case "$1" in
        "c")
            log_info "LANGUAGE SELECTED: C"
            ;;
        "cpp") 
            log_info "LANGUAGE SELECTED: C++"
            ;;
        *)
            log_error "UNKNOWN OR UNSUPPORTED LANGUAGE"
            exit 1;
            ;;
    esac
}