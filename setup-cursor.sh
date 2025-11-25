#!/bin/bash

# Setup seekDB rules for Cursor IDE
# This script copies seekDB documentation files to Cursor's rules directory
# Usage: ./setup-cursor.sh [--all|--core|--sql|--python|--vector|--hybrid|--hybrid-index|--ai-functions]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$SCRIPT_DIR/seekdb-plugin/skills/add-seekdb-docs/docs"

# Target directory for Cursor rules
CURSOR_RULES_DIR=".cursor/rules"

# Available documentation sets
declare -A DOC_SETS=(
    ["core"]="seekdb-core.mdc"
    ["sql"]="seekdb-sql.mdc"
    ["python"]="seekdb-python-sdk.mdc"
    ["vector"]="seekdb-vector-search.mdc"
    ["hybrid"]="seekdb-hybrid-search.mdc"
    ["hybrid-index"]="seekdb-hybrid-vector-index.mdc"
    ["ai-functions"]="seekdb-ai-functions.mdc"
)

# Function to print usage
usage() {
    cat << EOF
${BLUE}seekDB Cursor Setup Script${NC}

This script copies seekDB documentation files to your Cursor IDE rules directory.

${YELLOW}Usage:${NC}
  ./setup-cursor.sh [OPTION]

${YELLOW}Options:${NC}
  --all              Copy all documentation files (recommended)
  --core             Copy core guidelines and overview
  --sql              Copy SQL syntax reference
  --python           Copy Python SDK guide
  --vector           Copy vector search guide
  --hybrid           Copy hybrid search guide
  --hybrid-index     Copy hybrid vector index guide
  --ai-functions     Copy AI functions guide
  --help             Show this help message

${YELLOW}Examples:${NC}
  ./setup-cursor.sh --all
  ./setup-cursor.sh --core --sql
  ./setup-cursor.sh --python

${YELLOW}Default:${NC}
  If no option is provided, all documentation files will be copied.

EOF
    exit 0
}

# Function to copy files
copy_files() {
    local files_to_copy=("$@")
    local copied_count=0
    local failed_count=0

    # Create .cursor/rules directory if it doesn't exist
    if [ ! -d "$CURSOR_RULES_DIR" ]; then
        echo -e "${BLUE}Creating directory: $CURSOR_RULES_DIR${NC}"
        mkdir -p "$CURSOR_RULES_DIR"
    fi

    # Copy each file
    for file in "${files_to_copy[@]}"; do
        local source_file="$DOCS_DIR/$file"
        local target_file="$CURSOR_RULES_DIR/$file"

        if [ ! -f "$source_file" ]; then
            echo -e "${RED}✗ File not found: $source_file${NC}"
            ((failed_count++))
            continue
        fi

        if cp "$source_file" "$target_file"; then
            echo -e "${GREEN}✓ Copied: $file${NC}"
            ((copied_count++))
        else
            echo -e "${RED}✗ Failed to copy: $file${NC}"
            ((failed_count++))
        fi
    done

    return $failed_count
}

# Function to list copied files
list_files() {
    if [ -d "$CURSOR_RULES_DIR" ]; then
        local count=$(find "$CURSOR_RULES_DIR" -maxdepth 1 -name "seekdb-*.mdc" 2>/dev/null | wc -l)
        if [ $count -gt 0 ]; then
            echo -e "\n${BLUE}seekDB files in $CURSOR_RULES_DIR:${NC}"
            ls -1 "$CURSOR_RULES_DIR"/seekdb-*.mdc 2>/dev/null | sed 's|.*/||' | sed 's/^/  /' || true
        fi
    fi
}

# Main script logic
main() {
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║     seekDB Cursor Rules Setup          ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}\n"

    # Check if docs directory exists
    if [ ! -d "$DOCS_DIR" ]; then
        echo -e "${RED}Error: Documentation directory not found: $DOCS_DIR${NC}"
        exit 1
    fi

    # Parse arguments
    if [ $# -eq 0 ] || [ "$1" = "--all" ]; then
        # Copy all files
        echo -e "${YELLOW}Mode: Copy all documentation files${NC}\n"
        files_to_copy=("${DOC_SETS[@]}")
    elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
        usage
    else
        # Copy selected files
        files_to_copy=()
        for arg in "$@"; do
            case "$arg" in
                --core) files_to_copy+=("${DOC_SETS[core]}") ;;
                --sql) files_to_copy+=("${DOC_SETS[sql]}") ;;
                --python) files_to_copy+=("${DOC_SETS[python]}") ;;
                --vector) files_to_copy+=("${DOC_SETS[vector]}") ;;
                --hybrid) files_to_copy+=("${DOC_SETS[hybrid]}") ;;
                --hybrid-index) files_to_copy+=("${DOC_SETS[hybrid-index]}") ;;
                --ai-functions) files_to_copy+=("${DOC_SETS[ai-functions]}") ;;
                *)
                    echo -e "${RED}Unknown option: $arg${NC}"
                    usage
                    ;;
            esac
        done

        if [ ${#files_to_copy[@]} -eq 0 ]; then
            echo -e "${RED}No valid options provided${NC}"
            usage
        fi

        echo -e "${YELLOW}Mode: Copy selected documentation files${NC}\n"
    fi

    # Copy files
    copy_files "${files_to_copy[@]}" || true

    # Show summary
    echo -e "\n${BLUE}═══════════════════════════════════════${NC}"
    echo -e "${BLUE}Setup Summary${NC}"
    echo -e "${BLUE}═══════════════════════════════════════${NC}"
    echo -e "Target directory: ${YELLOW}$CURSOR_RULES_DIR${NC}"
    list_files

    echo -e "\n${GREEN}✓ Setup complete!${NC}"
    echo -e "\n${BLUE}Next steps:${NC}"
    echo -e "1. Open or reload Cursor IDE"
    echo -e "2. Cursor will automatically detect the rules in ${YELLOW}$CURSOR_RULES_DIR${NC}"
    echo -e "3. Start using seekDB in your projects!\n"
}

# Run main function
main "$@"
