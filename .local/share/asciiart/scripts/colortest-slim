#!/usr/bin/env bash

# Author: machinebacon
# Source: http://linuxbbq.org/bbs/viewtopic.php?f=4&t=1656#p33237

T='*'   # The test text

echo -e "\n             40m 41m 42m 43m\
 44m 45m 46m 47m";

for FGs in '    m' '   1m' '  30m' '1;90m' '  31m' '1;91m' '  32m' \
           '1;92m' '  33m' '1;93m' '  34m' '1;94m' '  35m' '1;95m' \
           '  36m' '1;96m' '  37m' '1;97m';
  do FG=${FGs// /}
  echo -en " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
    do echo -en "$EINS \033[$FG\033[$BG $T \033[0m";
  done
  echo;
done
echo
