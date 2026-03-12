#!/bin/sh
set -eu

config_template="$HOME/.config/superarch/waybar/config.template"
style_template="$HOME/.config/superarch/waybar/style.template.css"
config_output="$HOME/.config/waybar/config"
style_output="$HOME/.config/waybar/style.css"

mkdir -p "$(dirname "$config_output")"

# Remove decimal from font size (12.0 -> 12)
size_int="${FONT_SIZE%.*}"

# Copy config as-is
cp "$config_template" "$config_output"

# Generate style.css with fonts and ALL base16 colors
sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
    -e "s/FONT_STYLE/$FONT_STYLE/g" \
    -e "s/FONT_SIZE/$size_int/g" \
    -e "s/COLOR_BASE00/$COLOR_BASE00/g" \
    -e "s/COLOR_BASE01/$COLOR_BASE01/g" \
    -e "s/COLOR_BASE02/$COLOR_BASE02/g" \
    -e "s/COLOR_BASE03/$COLOR_BASE03/g" \
    -e "s/COLOR_BASE04/$COLOR_BASE04/g" \
    -e "s/COLOR_BASE05/$COLOR_BASE05/g" \
    -e "s/COLOR_BASE06/$COLOR_BASE06/g" \
    -e "s/COLOR_BASE07/$COLOR_BASE07/g" \
    -e "s/COLOR_BASE08/$COLOR_BASE08/g" \
    -e "s/COLOR_BASE09/$COLOR_BASE09/g" \
    -e "s/COLOR_BASE0A/$COLOR_BASE0A/g" \
    -e "s/COLOR_BASE0B/$COLOR_BASE0B/g" \
    -e "s/COLOR_BASE0C/$COLOR_BASE0C/g" \
    -e "s/COLOR_BASE0D/$COLOR_BASE0D/g" \
    -e "s/COLOR_BASE0E/$COLOR_BASE0E/g" \
    -e "s/COLOR_BASE0F/$COLOR_BASE0F/g" \
    "$style_template" > "$style_output"

# Restart waybar silently
restart waybar >/dev/null 2>&1 || true
