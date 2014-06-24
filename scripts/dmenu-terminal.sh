#!/bin/zsh

# use the terminal emulator passed-in, or fall back to terminal variable, urxvt or xterm if installed
if [ "$#" -ne 1 ]; then
  TERMINAL="$1"
fi

if [ ! -x "$TERMINAL" -a -x "$(command -v urxvt)" ]; then
  TERMINAL="$(command -v urxvt)"
elif [ -x "$(command -v xterm)" ]; then
  TERMINAL="$(command -v xterm)"
else
  echo "Usage: $0 <some-terminal>"
  exit 64
fi

# make sure dmenu is installed
if [ ! -x "$(command -v dmenu)" ]; then
  echo "Requires dmenu"
  exit 69
fi

#FIXME: search multiple directories
choice=$(ls /usr/bin | dmenu)
binary=$(awk '{print $1;}' <<< $choice)

if [ -x "$(command -v $choice)" ]; then
  #FIXME: Wayland
  if ldd /usr/bin/$binary | grep libX11 > /dev/null; then
    $choice
  else
    $TERMINAL -e $choice
  fi
fi
