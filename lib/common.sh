#!/bin/bash

log()     { echo "[*] $1"; }
success() { echo "[+] $1"; }
warning() { echo "[!] $1"; }
error()   { echo "[-] $1"; }

check_tool() {
    if ! command -v "$1" >/dev/null 2>&1; then
        error "Required tool not found: $1"
        return 1
    fi
}

setup_output() {
    local target="$1"
    local dir="./output/${target//\//_}"
    mkdir -p "$dir"
    echo "$dir"
}
