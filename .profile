#!/bin/sh
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/"$(id -u)"-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1

export PATH="${PATH}":~/.local/bin

[ "$(tty)" = "/dev/tty1" ] &&
  # exec dbus-launch --sh-syntax --exit-with-session sway
  exec dbus-run-session sway
