#!/usr/bin/env bash
# shellcheck shell=bash

# id -> "family|style"
declare -Ag SUPERARCH_FONTS=(
  [meslo]='MesloLGS Nerd Font|Regular'
  [jetbrains]='JetBrainsMono Nerd Font|Regular'
)

superarch_font_ids() {
  printf '%s\n' "${!SUPERARCH_FONTS[@]}" | sort
}

superarch_font_get() {
  local id="$1"
  local v="${SUPERARCH_FONTS[$id]-}"
  [[ -n "$v" ]] || return 1
  printf '%s\n' "$v"
}
