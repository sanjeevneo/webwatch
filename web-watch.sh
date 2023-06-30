#!/usr/bin/env bash

# Exit on error, undefined variable, or error in a pipeline
set -euo pipefail

# Variables
url=$1
query=${2:-}
state_dir="${XDG_DATA_HOME:-$HOME/.local/share}/web-watch"
state_file="${state_dir}/${url//\//_}-${query//\//_}"

# Create state directory if it doesn't exist
mkdir -p "$state_dir"

# Create a temporary file
tmp_file=$(mktemp)

# Fetch the webpage content
curl --silent --fail --location --output "$tmp_file" "$url"

# Process the webpage content with XPath query if provided
if [[ -n "$query" ]]; then
  processed_file=$(mktemp)
  xmllint --html --xpath "$query" "$tmp_file" > "$processed_file" 2>/dev/null
  mv "$processed_file" "$tmp_file"
fi

# Show a diff between the previous and current content
if [[ -e "$state_file" ]]; then
  diff -u "$state_file" "$tmp_file" || true
fi

# Update the state file with the current content
mv "$tmp_file" "$state_file"
