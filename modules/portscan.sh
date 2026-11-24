#!/bin/bash

run_portscan() {
    local target="$1"
    local outdir="$2"

    log "Starting port scan with nmap..."

    if ! check_tool nmap; then
        return
    fi

    nmap -T4 -F -sV --open -oN "$outdir/nmap_fast.txt" "$target"

    success "Nmap results saved → $outdir/nmap_fast.txt"
}
