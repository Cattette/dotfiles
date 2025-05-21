# mudow

mudow is a simple bash script powered by [rofi](https://github.com/davatorium/rofi) and [yt-dlp](https://github.com/yt-dlp/yt-dlp) to download and organize albums/playlists from online sources.

Album and artist information is stored in the 'album-list' and 'artist-list' files. These can be located anywhere on your device as long as you follow step 1 in setup. 

## Dependencies

* rofi
* yt-dlp
* dunst (or any other notification daemon)

## Setup

1. Make sure that the 'artls' and 'albumls' variables inside the 'mudow.sh' script are set to your 'artist-list' and 'album-list' files. This is done by default.
2. The 'albumdir' variable where all the album/playlist folders will be dumped into. This is set to your ~/Music directory by default.
3. The script can be invoked in any environment. Just run it with a url as the first argument. Example:

```$ mudow.sh https://www.youtube.com/playlist?list=OLAK5uy_nB2_mP3jO6pw6O7nfwFGQQrUC7HC1LaF0```

