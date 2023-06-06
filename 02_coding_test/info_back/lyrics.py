from lyricsgenius import Genius
import constants
import re 


# Make some functions so you can call on each. i.e. just pull lyrics, sort, etc. 


# Use another untracked file for this. Use variable and import.
token = constants.api_token 


# List songs by an artist 
#genius= Genius(token)
#artist = genius.search_artist("Metallica", max_songs=3, sort="title")
#print(artist.songs)


# Print Lyrics of a Song
genius = Genius(token)
artist = genius.search_artist("Metallica", max_songs=2, sort='popularity')
song = input('What is the song title you want lyrics for? ')
song = artist.song(song)
s_lyrics = song.lyrics
#print(s_lyrics)

# Take the output, take anything out of inside '[]' and then count words, print top 5 words. 

lyrics_only = re.sub("[\(\[].*?[\)\]]", "", s_lyrics)
#lyrics_only = str(lyrics_only)
#print(lyrics_only)

#This function will be used by the next to remove any articles / connector words / Identifiers (ex. I, me, you, and, the)
def remove_words(dictionary, words):
    return {key: value for key, value in dictionary.items() if key not in words}
words_to_remove = ["i", "am", "we", "me", "my", "as", "the", "you", "and", "the", "to", "oh,", "oh", "in", "that", "is"]

# This function:
# Converts the lyrics into a one line string for easier parsing
# Counts the remaining words
# Calls on _function_ to remove entries
# Outputs top 5 words per song with their word count
def word_count(str):
    str = str.lower()
    str = " ".join(str.splitlines()) 
    counts = dict()
    words = str.split()
    for word in words:
        if word in counts:
            counts[word] += 1
        else:
             counts[word] = 1
    counts = remove_words(counts, words_to_remove)
    sorted_counts = sorted(counts.items(), key=lambda x:x[1])
    conv_sorted_counts = list(sorted_counts)
    top_5 = conv_sorted_counts[-5:]
    top_5.reverse() 

    for tuple in top_5:
        print(*tuple)
    




# Outputs

#print(s_lyrics)
#print(lyrics_only)
print(word_count(lyrics_only))