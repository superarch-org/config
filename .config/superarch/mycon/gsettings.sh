#!/bin/sh
set -eu

template="$HOME/.config/superarch/gtk-3.0/settings.ini.template"
output="$HOME/.config/gtk-3.0/settings.ini"

mkdir -p "$(dirname "$output")"

# Just copy the template as-is
cp "$template" "$output"
