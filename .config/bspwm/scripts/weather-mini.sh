#!/bin/sh
#curl -sS "wttr.in/?format=%t"
#curl -sS "wttr.in/38.906551,111.2222683?format="%c+%t+%h""
#curl -sS "https://wttr.in/?format=3"

echo "$(curl -sS "https://wttr.in/Mexico?format=3")"
