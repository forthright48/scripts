#!/bin/bash

# Command exists
command_exists() {
    type "$1" &>/dev/null
}

# colorful echo
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export NC='\033[0m' # No Color
echo_info() {
    echo -e "${GREEN}$@${NC}"
}
echo_danger() {
    echo -e "${RED}$@${NC}"
}

export -f echo_info echo_danger command_exists