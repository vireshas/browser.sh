#!/bin/bash -e

platform=`uname`

if [ -t 0 ]; then
  if [ -n "$1" ]; then
    if [[ "$platform" == "Linux" ]]; then
      xdg-open $1
    elif [[ "$platform" == "Darwin" ]]; then
      open $1
    fi
  else
    cat <<usage
Usage: browser
    pipe html or any file to browser

$ echo '<h1>hi mom!</h1>' | browser
$ ron -5 man/rip.5.ron | browser
$ browser example.pdf
$ cat test.html | browser

usage
fi
else
  f="/tmp/browser.$RANDOM.html"
  cat /dev/stdin > $f
  if [[ "$platform" == "Linux" ]]; then
    xdg-open $f
  elif [[ "$platform" == "Darwin" ]]; then
    open $f
  fi
fi
