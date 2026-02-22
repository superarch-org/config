#!/bin/sh
set -eu

outdir="$HOME/.config/current/font"
mkdir -p "$outdir"

# Generate alacritty include file
cat > "$outdir/alacritty.toml" <<EOF
[font]
size = $FONT_SIZE

[font.normal]
family = "$FONT_FAMILY"
style = "$FONT_STYLE"
EOF

# Reload if running
pgrep -x alacritty > /dev/null && touch ~/.config/alacritty/alacritty.toml
