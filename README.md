# Get Playlist  
_Download songs from YouTube specified as a listfile_  

---  

__Dependencies:__  
  - `ffmpeg`  
  - [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)  

__Instructions:__  
Creaate / Edit the `songs.list` file formatted as specified below. The number 
in the first column allows you to maintain the playlist order by title. The 
sample shown allows up to 99 songs sorted properly in one playlist, but there 
is no hard limit. You can keep adding `0` to the front to enable proper sorting
up to 1000 songs (000 - 999) or yet another `0` for proper sorting up to 10,000,
(0000 - 9999) you get the picture.  
  
Once you've got your `songs.list` formatted just run `./download_playlist.sh`  

__songs.list:__  
```bash
09 Song Title - Artist Name
10 Song Title - Artist Name
```  
