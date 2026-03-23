make_structure() {

	log_info "CREATING C STRUCTURE"

	local base_dir="$1"
	local subdirs=("src" "include" "bin")

	for dir in ${subdirs[@]}; do
		mkdir -p "$base_dir/$dir" || { log_error "FAIL TO CREATE $base_dir/$dir"; return 1; }
	done
	
	log_info "C STRUCTURE CREATED"

}

create_files() {

	log_info "CREATING C SOURCE FILES"
	
	local base_dir="$1"

	cat > "$base_dir/src/main.c" <<EOF
#include <stdio.h>

int main(){
	printf("Hello, World!\n");
	return 0;
}
EOF

}

setup_build() {

	log_info "CREATING CMAKE SETTINGS FOR C"
	
	local base_dir="$1"
	local name="$2"

	cat > "$base_dir/CMakeLists.txt" <<EOF
cmake_minimum_required(VERSION 3.10)

project($name C)

set(CMAKE_C_STANDARD 11)

add_executable($name src/main.c)
EOF

	log_info "CMAKE SETTINGS FOR C CREATED"	

}

