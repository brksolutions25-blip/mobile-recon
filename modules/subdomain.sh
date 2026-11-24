#!/bin/bash

run_subdomain() {
    local target="$1"
    local outdir="$2"

    log "Starting subdomain / DNS enumeration..."

    if ! check_tool dig; then
        return
    fi

    {
        echo "=== A Records ==="
        dig +short A "$target" || true
        echo
        echo "=== AAAA Records ==="
        dig +short AAAA "$target" || true
        echo
        echo "=== MX Records ==="
        dig +short MX "$target" || true
        echo
        echo "=== NS Records ==="
        dig +short NS "$target" || true
        echo
        echo "=== TXT Records ==="
        dig +short TXT "$target" || true
    } > "$outdir/dns_records.txt"

    success "DNS records saved → $outdir/dns_records.txt"
}
