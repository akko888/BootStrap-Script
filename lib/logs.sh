LOG_FILE="${LOG_FILE:-./info.log}"

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