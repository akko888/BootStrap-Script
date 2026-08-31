create_README() {

	log_info "CREATING README FILE"

	cat > "$BASE_DIRECTORY/README.MD" <<EOF || { log_error "FAILED TO CREATE README FILE"; return 1; }
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

create_gitignore() {

	log_info "CREATING .gitignore FILE"

	cat > "$BASE_DIRECTORY/.gitignore" <<EOF || { log_error "FAILED TO CREATE .gitignore FILE"; return 1; }
# OS
.DS_Store
Thumbs.db

# Editors
.vscode/
.idea/

# Logs
.log
logs/

# Build
bin/
build/
dist/
EOF

	log_info ".gitignore FILE CREATED "

}