# Lyrics
This simple Python app gives the user three options and then retrieves the data.

- Option 1 is to list top 3 songs of an artist sorted by popularity
- Option 2 is to list the top 5 most common words in a song (not including words like I, me, you, and, the, etc.)
- Option 3 is to display the lyrics of a song

# Get Started 

## Dependencies 

You will need the following in order to run:

Python3
lyricsgenius - You can install this by running ```pip install lyricsgenius``` 

## Fork This Repo

Fork it.


## Get Access Token

First we will need to sign up for a (free) account that authorizes access to [the Genius API](http://genius.com/api-clients). Once aigned up and logged in, go to the API sections on Genius and [create a new API client](https://genius.com/api-clients). After creating you client, you can generate an access token to use. Genius provides two kinds of tokens. For this purpose, a **client access token** will do just fine. 

You will then need to create a file **in this directory** called **contants.py**, it should contain the following:

```api_token= '<your_client_access_token_from_Genius>' ```

## Running The Program

From this directory run 
``` py lyrics.py ```

## Timeout Error

Please note that sometimes when running option 1 (top 3 songs by and artist) the Genius API will timeout and throw an error. If this occurs please run again.





## Still TODO:

- [X] Make opening a function
- [X] Make Each option a Function
- [ ] Include an input error on selection and loop back 
- [ ] Make CLI and be able to pass in arguments right away (V2)