create_log_file() {
	if [[ "$1" == true ]]; then
		LOG_FILE="${LOG_FILE:-./info.log}"
		LOG_FILE="$(realpath "$LOG_FILE")" || { log_error "FAILED TO FIND REALPATH OF LOG FILE"; return 1; }
		touch "$LOG_FILE" || { log_error "FAILED TO CREATED LOG FILE"; return 1; }
		log_info "LOG FILE CREATED"
	else
		LOG_FILE="/dev/null"
		log_info "CONTINUING WITH NO LOG FILE"
	fi
}

timestamp() {
	date "+%Y-%m-%d %H:%M:%S"
}

log() {
	local level="$1"
	local message="$2"
	local timestamp="$(timestamp)"

	echo "[$timestamp] [$level] [$message]" | tee -a "$LOG_FILE"
}

log_info() {
	log "INFO" "$1"
}

log_error() {
	log "ERROR" "$1"
}

log_exit() {
	log "EXIT" "$1"
}

log_success() {
	log "SUCCESS" "$1" 
}