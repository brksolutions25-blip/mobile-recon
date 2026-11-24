#!/bin/bash

cd "$(dirname "$0")"
source lib/common.sh
source config.conf

TARGET="$1"

if [ -z "$TARGET" ]; then
    echo "Usage: $0 <target>"
    echo "Example: $0 scanme.nmap.org"
    exit 1
fi

echo "[*] Target: $TARGET"
TARGET_DIR=$(setup_output "$TARGET")
echo "[+] Output: $TARGET_DIR"
echo

source modules/subdomain.sh
run_subdomain "$TARGET" "$TARGET_DIR"

source modules/portscan.sh
run_portscan "$TARGET" "$TARGET_DIR"

source modules/webenum.sh
run_webenum "$TARGET" "$TARGET_DIR"

source modules/report.sh
generate_report "$TARGET" "$TARGET_DIR"

echo
echo "[+] Done. Results saved in $TARGET_DIR"
