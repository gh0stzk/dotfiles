#!/usr/bin/env bash

# ANSI color scheme script featuring PACMAN
# Author: pfh
# Source: http://crunchbang.org/forums/viewtopic.php?pid=144481#p144481 
# Initializing procedure by lolilolicon

f=3 b=4
for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done
for i in {0..7}; do
    printf -v fbright$i %b "\e[9${i}m"
done
bld=$'\e[1m'
rst=$'\e[0m'
inv=$'\e[7m'

cat << EOF

$rst
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄    
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄  $f5▄█$f7███$f5██$f7███$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f7▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██  $f5██$f7█ █$f5██$f7█ █$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f7▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████  
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀ 
$bld
 $fbright3  ▄███████▄                $fbright1  ▄██████▄    $fbright2  ▄██████▄    $fbright4  ▄██████▄    $fbright5  ▄██████▄    $fbright6  ▄██████▄    
 $fbright3▄█████████▀▀               $fbright1▄$fbright7█▀█$fbright1██$fbright7█▀█$fbright1██▄  $fbright2▄█$fbright7█ █$fbright2██$fbright7█ █$fbright2█▄  $fbright4▄█$fbright7█ █$fbright4██$fbright7█ █$fbright4█▄  $fbright5▄█$fbright7█ █$fbright5██$fbright7█ █$fbright5█▄  $fbright6▄██$fbright7█▀█$fbright6██$fbright7█▀█$fbright6▄
 $fbright3███████▀      $fbright7▄▄  ▄▄  ▄▄   $fbright1█$fbright7▄▄█$fbright1██$fbright7▄▄█$fbright1███  $fbright2██$fbright7███$fbright2██$fbright7███$fbright2██  $fbright4██$fbright7███$fbright4██$fbright7███$fbright4██  $fbright5██$fbright7███$fbright5██$fbright7███$fbright5██  $fbright6███$fbright7█▄▄$fbright6██$fbright7█▄▄$fbright6█
 $fbright3███████▄      $fbright7▀▀  ▀▀  ▀▀   $fbright1████████████  $fbright2████████████  $fbright4████████████  $fbright5████████████  $fbright6████████████  
 $fbright3▀█████████▄▄               $fbright1██▀██▀▀██▀██  $fbright2██▀██▀▀██▀██  $fbright4██▀██▀▀██▀██  $fbright5██▀██▀▀██▀██  $fbright6██▀██▀▀██▀██
 $fbright3  ▀███████▀                $fbright1▀   ▀  ▀   ▀  $fbright2▀   ▀  ▀   ▀  $fbright4▀   ▀  ▀   ▀  $fbright5▀   ▀  ▀   ▀  $fbright6▀   ▀  ▀   ▀ 
$rst

EOF
