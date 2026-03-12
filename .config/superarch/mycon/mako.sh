#!/bin/sh
set -eu

template="$HOME/.config/superarch/mako/config.template"
output="$HOME/.config/mako/config"

# Generate config from template, replacing FONT_ and ALL COLOR_ variables
sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
    -e "s/FONT_SIZE/${FONT_SIZE%.*}/g" \
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
    "$template" > "$output"

# Reload mako if running
pgrep -x mako > /dev/null && makoctl reload
