define_route(){
	
	log_info "CREATING DIRECTORY"

	if [[ -z "$1" || -z "$2" ]]; then
		log_error "NOT ENOUGH ARGUMENTS"
		exit 1
	fi

	mkdir -p "$1/$2"

	log_info "DIRECTORY CREATED"

}
