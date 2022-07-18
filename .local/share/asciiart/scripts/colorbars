#!/bin/sh
#
# colorbars - smpte color bars in sh
# http://git.io/colorbars 

echo

for y in $(seq 0 13); do
  printf %s '           '
  for color in 7 3 6 2 5 1 4; do
    tput setab ${color}
    printf %s '        '
  done
  tput sgr0
  echo
done

for y in 0 1; do
  printf %s '           '
  for color in 4 0 5 0 6 0 7; do
    tput setab ${color}
    printf %s '        '
  done
  tput sgr0
  echo
done

for y in $(seq 0 4); do
  printf %s '           '
  for color in 4 4 4 4 4 7 7 7 7 7 5 5 5 5 5 0 0 0 0 0 0 0 0 0 0 0 0 0; do
    tput setab ${color}
    printf %s '  '
  done
  tput sgr0
  echo
done

echo