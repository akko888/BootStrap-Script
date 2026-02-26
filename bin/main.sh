#!/usr/bin/env bash

source "$(dirname "$0")/../lib/logs.sh"
source "$(dirname "$0")/../lib/dirCreation.sh"

if [ $# -eq 0 ]; then
	log_error "NOT ENOUGH ARGUMENTS"
       	exit 1 	
fi

while [[ $# -gt 0 ]]; do
	case "$1" in
		-n|--name)
			NAME="$2"
			shift 2
			;;
		-r|--root)
			ROOT_DIRECTORY="$2"
			shift 2
			;;
		--)
			shift
			break
			;;
		-*)
			log_error "UNKNOWN OPTION"
			exit 1
			;;
		*)
			log_error "UNKNOWN ARGUMENT"
			exit 1
			;;
	esac
done

main() {
	log_info "INITIALIZING SCRIPT"
	define_route "$ROOT_DIRECTORY" "$NAME"
} 

main "$@"
