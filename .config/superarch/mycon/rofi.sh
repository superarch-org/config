#!/bin/sh
set -eu

outdir="$HOME/.config/current/font"
mkdir -p "$outdir"

# Remove decimal from size (12.0 -> 12)
size_int="${FONT_SIZE%.*}"

# Generate rofi font config
cat > "$outdir/rofi.rasi" <<EOF
configuration {
  font: "$FONT_FAMILY $FONT_STYLE $size_int";
}
EOF
