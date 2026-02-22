#!/bin/sh
set -eu

template="$HOME/.config/superarch/mako/config.template"
output="$HOME/.config/mako/config"

# Generate config from template
sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
    -e "s/FONT_SIZE/${FONT_SIZE%.*}/g" \
    "$template" > "$output"

# Reload mako if running
pgrep -x mako > /dev/null && makoctl reload
