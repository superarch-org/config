#!/bin/sh
set -eu

template="$HOME/.config/superarch/swayosd/style.template.css"
output="$HOME/.config/swayosd/style.css"

mkdir -p "$(dirname "$output")"

# Remove decimal from font size (12.0 -> 12)
size_int="${FONT_SIZE%.*}"

# Generate style.css from template
sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
    -e "s/FONT_SIZE/$size_int/g" \
    "$template" > "$output"

# Restart swayosd silently
restart swayosd >/dev/null 2>&1 || true
