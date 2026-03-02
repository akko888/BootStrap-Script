create_README() {

	log_info "CREATING README FILE"

	touch "$BASE_DIRECTORY/README.MD" || { log_error "FAIL TO CREATE README FILE"; return 1; }

	cat > "$BASE_DIRECTORY/README.MD" <<- 'EOF'
	### This is a new Project ฅ₍^•⩊ •マⳊ
	> STRUCTURE
	1. src = Here is all source code
	2. lib = Here you can put dependencies or extra code you need
	3. test = Here you can write or run necessary tests
	4. script = Here you can put any script you need
	5. docs = Here you have to put all documentation
EOF

	log_info "README FILE CREATED"	

}
