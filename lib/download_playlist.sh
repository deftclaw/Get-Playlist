#!/usr/bin/bash

ldx=1                                 # Line index
lmx=`wc song.list|awk '{print $1}'`   # Total lines in playlist

while [ $ldx -le $lmx ]
do
  line=`head -n $ldx song.list|tail -n1`                                                                  # Get Current line
  new_name=`echo ${line[@]}|sed -e 's/ - /-/g' -e 's/ /_/g'|tr [:upper:] [:lower:]`                        # Format the new name like: 01_song_name-artist_name

  yt-dlp -x --audio-format best --restrict-filenames "ytsearch:`echo ${line[@]}|sed -e 's/^[0-9]\+ //g'`"  # Search / download from youtube

  song=`ls | ag "$(echo ${line[@]}|sed -e 's/^[0-9]\+ //g'|awk -F' - ' '{print $1}'|sed -e 's/\s/_/g')"`   # Find the song file

  mv -v "${song[@]}" "${new_name[@]}.opus"                                                                 # Rename the song
  
  # Increment songlist line
  ldx=$(($ldx + 1))
done

# Convert the downloaded songs to flac
for song in ./*.opus
do
  ffmpeg -i "$song" "${song%.opus}.flac"
done
