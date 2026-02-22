#!/bin/sh
set -eu

config_template="$HOME/.config/superarch/waybar/config.template"
style_template="$HOME/.config/superarch/waybar/style.template.css"
config_output="$HOME/.config/waybar/config"
style_output="$HOME/.config/waybar/style.css"

mkdir -p "$(dirname "$config_output")"

# Remove decimal from font size (12.0 -> 12)
size_int="${FONT_SIZE%.*}"

# Generate config and style from templates
cp "$config_template" "$config_output"

sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
    -e "s/FONT_STYLE/$FONT_STYLE/g" \
    -e "s/FONT_SIZE/$size_int/g" \
    "$style_template" > "$style_output"

# Restart waybar if running
pkill -SIGUSR2 waybar 2>/dev/null || true
