#!/usr/bin/env bash

set -eEuo pipefail

LIB_SOURCE="$(realpath "$(dirname "$(realpath "$0")")/../lib")"

source "$LIB_SOURCE/logs.sh"
source "$LIB_SOURCE/dirCreation.sh"
source "$LIB_SOURCE/filesCreation.sh"
source "$LIB_SOURCE/languageDef.sh"

show_help() {
	cat << EOF
Usage: kirby [OPTIONS]

Options:
  -n, --name     Project name
  -r, --root     Root directory
  -l, --lang     Programming language
  -h, --help     Show this help message and exit

Examples:
  kirby -n MyApp -r ~/projects -l cpp
EOF
}

if [ $# -eq 0 ]; then
	show_help
    exit 1 	
fi

NAME=""
ROOT_DIRECTORY=""
LANGUAGE=""
BASE_DIRECTORY=""

while [[ $# -gt 0 ]]; do
	case "$1" in
		-n|--name)
			NAME="$2"; shift 2 ;;
		-r|--root)
			ROOT_DIRECTORY="$2"; shift 2 ;;
		-l|--lang)
			LANGUAGE="$2"; shift 2 ;;
		--help)
			show_help; exit 0 ;;
		--)
			shift; break ;;
		-*)
			log_error "UNKNOWN OPTION"; exit 1 ;;
		*)
			log_error "UNKNOWN ARGUMENT"; exit 1 ;;
	esac
done

if [[ -z  "$NAME" || -z "$ROOT_DIRECTORY" || -z "$LANGUAGE" ]]; then
	log_error "MISSING REQUIRED ARGUMENTS: -n (Name), -r (Root) and -l (Language) all are required"
	exit 1;
fi

clean_up() {
	local dir="$1"

	log_info "CLEANING UP"

	rm -rf "$dir" || { log_error "FATAL: FAILED TO DELETE DIRECTORY"; exit 1; }

	log_info "CLEANED UP SUCCESSFULLY"
	
	log_exit "PROCESS ABORTED"
}

trap '[[ -n "${BASE_DIRECTORY:-}" ]] && clean_up "$BASE_DIRECTORY"' ERR

main() {
	log_info "INITIALIZING SCRIPT"
	define_route "$ROOT_DIRECTORY" "$NAME"
	make_generic_structure "$BASE_DIRECTORY" 
	check_language "$LANGUAGE" "$LIB_SOURCE"
	make_structure "$BASE_DIRECTORY"
	create_files "$BASE_DIRECTORY"
	setup_build "$BASE_DIRECTORY" "$NAME"
	create_README
	create_gitignore	
	git_init
	log_success "SCRIPT FINALIZED CORRECTLY!"
	exit
}

git_init() {

	log_info "INITIALIZING REPOSITORY"
	
	cd "$BASE_DIRECTORY" || { log_error "FAIL TO ENTER $BASE_DIRECTORY"; return 1; }

	if [ ! -d ".git" ]; then
		git init || { log_error "FAIL TO INITIALIZE"; return 1; }
		git add .
		git commit -m "Initial commit" || { log_error "FAIL TO COMMIT"; return 1; }
	fi

	log_info "REPOSITORY INITIALIZED CORRECTLY"

}

main "$@"
