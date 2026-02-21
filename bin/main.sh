#!/usr/bin/env bash

source "$(dirname "$0")/../lib/logs.sh"
source "$(dirname "$0")/../lib/dirCreation.sh"

if [ $# -eq 0 ]; then
	log_error "NOT ENOUGH ARGUMENTS"
       	exit 1 	
fi

main() {
	log_info "INITIALIZING SCRIPT"
	define_route $1 $2
} 

main "$@"
