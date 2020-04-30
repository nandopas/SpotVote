# SpotVote

## Vote on albums from Spotify

SpotVote uses spotify web api to search for albums and add to app database.

Then go ahead and vote away on your favorite albums!

## To use locally

Run the rails server, currently configured to port 3000
Need to get your own API keys from Spotify and add as environement variables (Using Figaro Gem)
Search into the search box: this will make a call to Spotify's Web API and the album info will be downlaoded to the database
Album duplication is handled by the database primary keys, so a saved album and its votes will not be overwritten
Search away to see how many votes have been made on an album or go to the home page to see the top voted albums!

## For future

* Allow user sign in through spotify
* Limit voting to signed in users only so voting isn't mannipulated
* Allow user to save a discovered album to their Spotify
