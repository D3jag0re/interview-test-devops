from lyricsgenius import Genius
import constants 


#Make some functions so you can call on each. i.e. just pull lyrics, sort, etc. 


# Use another untracked file for this. Use variable and import.
token = constants.api_token 


# List songs by an artist 
#genius= Genius(token)
#artist = genius.search_artist("Metallica", max_songs=3, sort="title")
#print(artist.songs)

genius = Genius(token)
artist = genius.search_artist("Metallica", max_songs=3, sort='popularity')
song = "One"
song = artist.song(song)
print(song.lyrics)


