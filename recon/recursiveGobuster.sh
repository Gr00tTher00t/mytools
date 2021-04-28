run_gobuster() {
    local LEVEL=0
    local TARGET=$1
    local LEVELS=$2
    local NEXT_LEVEL=$((LEVEL + 1))
    local WORDLIST=$3
    local EXT=$4
    local THREADS=$5
    local OP=$6
 
    #echo "[-] Level = $LEVEL"
    #echo "[+] Busting $TARGET"
 
    if [ "${LEVEL}" -lt "${LEVELS}" ]; then
        #echo gobuster -f -q -e -k -r -t ${THREADS} -m dir -w "${WORDLIST}" -s "${RESPONSE_CODES}" -u ${TARGET} -a "${USER_AGENT}" 
        gobuster -f -e -k -r -t ${THREADS} -m dir -w "${WORDLIST}" -u ${TARGET} -a "${USER_AGENT}" | grep 'http.*Status: [234]' | sed 's/ (Status.*//' | while read HIT; do
            echo "[+] Found $HIT"
            run_gobuster ${HIT} ${NEXT_LEVEL}
        done
    fi
}