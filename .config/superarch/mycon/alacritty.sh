#!/bin/sh
set -eu

font_outdir="$HOME/.config/current/font"
colors_outdir="$HOME/.config/current/colors"
font_template="$HOME/.config/superarch/alacritty/font.template.toml"
colors_template="$HOME/.config/superarch/alacritty/colors.template.toml"

mkdir -p "$font_outdir" "$colors_outdir"

# Generate font config (if template exists, otherwise fallback to inline)
if [ -f "$font_template" ]; then
  sed -e "s/FONT_FAMILY/$FONT_FAMILY/g" \
      -e "s/FONT_STYLE/$FONT_STYLE/g" \
      -e "s/FONT_SIZE/$FONT_SIZE/g" \
      "$font_template" > "$font_outdir/alacritty.toml"
else
  # Fallback: generate inline
  cat > "$font_outdir/alacritty.toml" <<EOF
[font]
size = $FONT_SIZE

[font.normal]
family = "$FONT_FAMILY"
style = "$FONT_STYLE"
EOF
fi

# Generate colors config
sed -e "s/COLOR_BASE00/$COLOR_BASE00/g" \
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
    "$colors_template" > "$colors_outdir/alacritty.toml"

# Reload alacritty if running
pgrep -x alacritty > /dev/null && touch ~/.config/alacritty/alacritty.toml
