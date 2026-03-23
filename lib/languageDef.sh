declare -A LANGUAGES

LANGUAGES=(
    [c]="c"
    [cpp]="cpp"
)

check_language() {
    local lang="$1"

    log_info "CHECKING LANGUAGE..."

    if [[ -n "${LANGUAGES[$lang]:-}" ]]; then
        log_info "LANGUAGE SELECTED: ${LANGUAGES[$lang]}"
        source "$(dirname "$0")/../lib/langs/$lang.sh" || { log_error "FAIL TO LOAD LANGUAGE $lang"; return 1; }
    else
        log_error "UNKNOWN OR UNSOPPORTED LANGUAGE: $lang"
    fi
}