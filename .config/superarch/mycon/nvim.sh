#!/bin/sh
set -eu

runtime="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

for server in "$runtime"/nvim.*.0; do
  [ -S "$server" ] || continue
  nvim --server "$server" \
    --remote-send '<Cmd>lua require("theme").setup()<CR>' \
    2>/dev/null || true
done
