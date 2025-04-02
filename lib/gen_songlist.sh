#!/usr/bin/env bash

. $XP/01reply.sh

function titleize() {
  usage="[0m[1m
Usage:
  titleize <string>
[0m"
  [[ -z "$1" ]] && reply -e "<string> is required${usage}"

  no_caps=(a and but is of or the to)
  list=($1)
  out=${list^}

  for s in ${list[@]:1}
  do
    if [[ ${no_caps[@]} =~ $s ]] 
    then out+=" ${s}"
    else out+=" ${s^}"
    fi
  done

  printf "${out}"
}

function write_list() {
  [[ -r 'song.list' ]] && rm -v 'song.list'
  songs=(`ls|ag -v 'lib|README.md'`)

  for s in ${songs[@]}
  do
    name="`echo $s|sed 's/\.flac$//g'|sed 's/_/ /g'|sed 's/-/ - /g'`"
    title=`titleize "${name[@]}"`

    echo "${title[@]}" >> song.list
  done
}

write_list
