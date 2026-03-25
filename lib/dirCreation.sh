define_route(){
	
	if [[ -z "$1" || -z "$2" ]]; then
		log_error "NOT ENOUGH ARGUMENTS"
		return 1
	fi

	log_info "CREATING DIRECTORY $1/$2"

	if [[ -d "$1/$2" ]]; then
		log_error "DIRECTORY $1/$2 ALREADY EXISTS"
		return 1
	fi

	mkdir -p "$1/$2" || { log_error "FAILED TO CREATE DIRECTORY $1/$2"; return 1; }

	BASE_DIRECTORY="$1/$2"

	log_info "DIRECTORY $1/$2 CREATED"

}

make_generic_structure() {
	
	log_info "CREATING GENERIC STRUCTURE"

	local base_dir="$1"

	mkdir -p "$base_dir/src" || { log_error "FAIL TO CREATE GENERIC STRUCTURE [src]"; return 1; }

	log_info "GENERIC STRUCTURE CREATED"

}
