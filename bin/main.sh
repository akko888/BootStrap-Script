#!/usr/bin/env bash

set -eEuo pipefail

source "$(dirname "$0")/../lib/logs.sh"
source "$(dirname "$0")/../lib/dirCreation.sh"
source "$(dirname "$0")/../lib/filesCreation.sh"
source "$(dirname "$0")/../lib/languageDef.sh"

if [ $# -eq 0 ]; then
	log_error "NOT ENOUGH ARGUMENTS"
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

trap '[[ -n "$BASE_DIRECTORY" ]] && clean_up "$BASE_DIRECTORY"' ERR

main() {
	log_info "INITIALIZING SCRIPT"
	define_route "$ROOT_DIRECTORY" "$NAME"
	log_info "DIRECTORIES PROCESS COMPLETED"
	check_language "$LANGUAGE"
	create_README	
	
} 

main "$@"
