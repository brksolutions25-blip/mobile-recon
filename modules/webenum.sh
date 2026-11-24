#!/bin/bash

run_webenum() {
    local target="$1"
    local outdir="$2"

    log "Starting web enumeration..."

    local url=""
    if curl -s -o /dev/null --connect-timeout 5 "https://$target"; then
        url="https://$target"
    elif curl -s -o /dev/null --connect-timeout 5 "http://$target"; then
        url="http://$target"
    else
        warning "No web server detected on $target"
        return
    fi

    success "Web target detected: $url"
    echo "$url" > "$outdir/web_url.txt"

    if command -v whatweb >/dev/null 2>&1; then
        whatweb -a 3 "$url" --log-brief="$outdir/whatweb.txt" 2>/dev/null || true
        success "WhatWeb results → $outdir/whatweb.txt"
    else
        warning "whatweb not installed – skipping technology detection"
    fi
}
