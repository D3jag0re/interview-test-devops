from lyricsgenius import Genius
import constants
import re 

#-------------------------------------------------------------------------------------------------------------------------#
# Use another untracked file for the token. Use variable and import.
#-------------------------------------------------------------------------------------------------------------------------#

token = constants.api_token 

#-------------------------------------------------------------------------------------------------------------------------#
# Define any global variables
#-------------------------------------------------------------------------------------------------------------------------#

lyrics_only = "" 

#-------------------------------------------------------------------------------------------------------------------------#
# Function to list songs by an artist by popularity
#-------------------------------------------------------------------------------------------------------------------------#

def top5_songs():
    inp_artist = input("\nType In The Name Of the Artist: ")
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
# This function will be used to retrieve the lyrics for the selected song
#-------------------------------------------------------------------------------------------------------------------------#

def get_lyrics():
    genius = Genius(token)
    # User Inputs
    artist= input("\nType In The Name Of the Artist: ") 
    song_song= input("Type In The Name Of the Song: ")

    # Searches for song and retrieves the lyrics
    song = genius.search_song(song_song, artist)
    s_lyrics = song.lyrics

    # Take the output, take anything out of inside '[]' and then count words, print top 5 words. 
    lyrics_only = re.sub("[\(\[].*?[\)\]]", "", s_lyrics)
    lyrics_only = str(lyrics_only)
    return lyrics_only
    

#-------------------------------------------------------------------------------------------------------------------------#

# This function:
#   Converts the lyrics into a one line string for easier parsing
#   Counts the remaining words
#   Calls on remove_words function to remove entries
#   Outputs top 5 words per song with their word count

#-------------------------------------------------------------------------------------------------------------------------#

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
        
#-------------------------------------------------------------------------------------------------------------------------#
# Main - Give the user two choices and execute above functions accordingly
#-------------------------------------------------------------------------------------------------------------------------#

opening_line = """---------------------------------------------------- \n
Successful Launch! Please See Below For Instructions \n  
----------------------------------------------------"""
def main():
    print(opening_line)
    print("\nWhat would you like to do?\n")
    print("1. Top 3 Most Popular Songs By An Artist")
    print("2. Top 5 Most Used Words In a Song" )
    print("3. Get Lyrics To a Song\n")
    choice = input("Please Make Your Selection: ")
    if choice == '1':
        top5_songs()
    if choice == '2':
        print(word_count(get_lyrics()))
    if choice == '3':
        print(get_lyrics())
    #else:
    #    print("Please Make a Selection Between 1 and 2")
         
if __name__ == "__main__":
    main()