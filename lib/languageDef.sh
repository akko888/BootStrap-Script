declare -A LANGUAGES

LANGUAGES=(
    [c]="c"
    [cpp]="cpp"
)

check_language() {
    local lang="$1"

    log_info "CHECKING LANGUAGE..."

    if [[ -n "${LANGUAGES[$lang]:-}" ]]; then
        log_info "LANGUAGE SELECTED: "${LANGUAGES[$lang]}""
    else
        log_error "UNKNOWN OR UNSOPPORTED LANGUAGE: $lang"
    fi
}