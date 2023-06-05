from lyricsgenius import Genius
import constants 


#Make some functions so you can call on each. i.e. just pull lyrics, sort, etc. 


# Use another untracked file for this. Use variable and import.
token = constants.api_token 


# List songs by an artist 
#genius= Genius(token)
#artist = genius.search_artist("Metallica", max_songs=3, sort="title")
#print(artist.songs)


# Print Lyrics of a Song
genius = Genius(token)
artist = genius.search_artist("Metallica", max_songs=3, sort='popularity')
song = input('What is the song title you want lyrics for? ')
song = artist.song(song)
print(song.lyrics)


