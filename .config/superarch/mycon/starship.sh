#!/bin/sh
set -eu

OUT="$HOME/.config/current/starship.toml"

base0D="${COLOR_BASE0D:-#5555ff}"
base0E="${COLOR_BASE0E:-#ff55ff}"
base08="${COLOR_BASE08:-#ff5555}"
base0B="${COLOR_BASE0B:-#55ff55}"
base09="${COLOR_BASE09:-#ffaa00}"
base0A="${COLOR_BASE0A:-#ffff55}"
base0C="${COLOR_BASE0C:-#55ffff}"

cat > "$OUT" << EOF
add_newline = false

[directory]
style = "bold fg:${base0D}"
truncation_length = 3

[git_branch]
symbol = " "
style = "fg:${base0E}"

[git_status]
style = "fg:${base08}"

[character]
success_symbol = "[→](fg:${base0B})"
error_symbol = "[→](fg:${base08})"

[nodejs]
style = "fg:${base0A}"

[python]
style = "fg:${base0A}"

[rust]
style = "fg:${base0A}"

[golang]
style = "fg:${base0A}"

[package]
style = "fg:${base09}"
EOF
