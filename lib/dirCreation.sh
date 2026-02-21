define_route(){
	
	log_info "CREATING DIRECTORY"

	if [[ -z "$1" || -z "$2" ]]; then
		log_error "NOT ENOUGH ARGUMENTS"
	fi

	log_info "DIRECTORY CREATED"

	mkdir -p "$1/$2"

}
