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

	create_subdirectories "$BASE_DIRECTORY"

}

create_subdirectories(){
	
	log_info "CREATING SUBDIRECTORIES"

	local base_dir="$1"
	local subdirs=("src" "lib" "test" "scripts" "docs")

	for dir in "${subdirs[@]}"; do
		mkdir -p "$base_dir/$dir" || { log_error "FAILED TO CREATE $base_dir/$dir"; return 1; }
	done

	log_info "SUBDIRECTORIES CREATED"

}
