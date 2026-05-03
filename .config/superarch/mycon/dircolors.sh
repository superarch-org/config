#!/bin/sh
set -eu

OUT="$HOME/.config/current/dircolors"

# Convert hex #RRGGBB to nearest ANSI 256 color index
hex_to_256() {
  hex="${1#\#}"
  r=$((16#${hex%????} ))
  g=$(( (16#${hex#??}) >> 8 ))
  b=$((16#${hex#????} ))
  # Map to 6x6x6 color cube (indices 16-231)
  ri=$(( (r * 5 + 127) / 255 ))
  gi=$(( (g * 5 + 127) / 255 ))
  bi=$(( (b * 5 + 127) / 255 ))
  echo $(( 16 + 36 * ri + 6 * gi + bi ))
}

dir=$(hex_to_256 "${COLOR_BASE0D:-#5555ff}")       # blue - dirs
link=$(hex_to_256 "${COLOR_BASE0C:-#55ffff}")      # cyan - symlinks
exec=$(hex_to_256 "${COLOR_BASE0B:-#55ff55}")      # green - executables
special=$(hex_to_256 "${COLOR_BASE0E:-#ff55ff}")   # magenta - special files
warning=$(hex_to_256 "${COLOR_BASE08:-#ff5555}")   # red - orphans/missing

cat > "$OUT" << EOF
RESET 0
DIR 01;38;5;${dir}
LINK 01;38;5;${link}
MULTIHARDLINK 00
FIFO 40;33
SOCK 01;38;5;${special}
DOOR 01;38;5;${special}
BLK 40;33;01
CHR 40;33;01
ORPHAN 01;38;5;${warning}
MISSING 00
SETUID 37;41
SETGID 30;43
CAPABILITY 00
STICKY_OTHER_WRITABLE 30;42
OTHER_WRITABLE 38;5;${dir};42
STICKY 37;44
EXEC 01;38;5;${exec}
EOF
