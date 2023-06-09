from lyricsgenius import Genius
import constants
import re 

#-------------------------------------------------------------------------------------------------------------------------#
# Use another untracked file for the token. Use variable and import.
#-------------------------------------------------------------------------------------------------------------------------#

token = constants.api_token 

#-------------------------------------------------------------------------------------------------------------------------#
# Function to list songs by an artist by popularity
#-------------------------------------------------------------------------------------------------------------------------#

def top5_songs():
    inp_artist = input("Type In The Name Of the Artist:")
    genius= Genius(token)
    artist = genius.search_artist(inp_artist, max_songs=3, sort="popularity")
    print(artist.songs)

#-------------------------------------------------------------------------------------------------------------------------#
# This function will be used by the next to remove any articles / connector words / Identifiers (ex. I, me, you, and, the)
#-------------------------------------------------------------------------------------------------------------------------#

def remove_words(dictionary, words):
    return {key: value for key, value in dictionary.items() if key not in words}
words_to_remove = ["i", "am", "we", "me", "my", "as", "the", "you", "and", "the", "to", "oh,", "oh", "in", "that", "is"]


#-------------------------------------------------------------------------------------------------------------------------#
# Main - Give the user two choices and execute accordingly
#-------------------------------------------------------------------------------------------------------------------------#

opening_line = """---------------------------------------------------- \n
Successful Launch! Please See Below For Instructions \n  
----------------------------------------------------"""
def main():
    print(opening_line)
    print("\nWhat would you like to do?\n")
    print("1. Top 3 Most Popular Songs By An Artist")
    print("2. Top 5 Most Used Words In a Song?\n")
    choice = input("Please Make Your Selection:")
    if choice == '1':
        top5_songs()
    if choice == '2':
        print("ok DONE")
    else:
        print("Please Make a Selection Between 1 and 2")
        return 


if __name__ == "__main__":
    main()

# Print Lyrics of a Song
#genius = Genius(token)
#artist = genius.search_artist("Metallica", max_songs=2, sort='popularity')
#song = input('What is the song title you want lyrics for? ')
#song = artist.song(song)
#s_lyrics = song.lyrics
#print(s_lyrics)

# Take the output, take anything out of inside '[]' and then count words, print top 5 words. 

#lyrics_only = re.sub("[\(\[].*?[\)\]]", "", s_lyrics)
#lyrics_only = str(lyrics_only)
#print(lyrics_only)

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
#print(word_count(lyrics_only))