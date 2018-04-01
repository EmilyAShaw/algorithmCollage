#!/bin/bash

# show commands and stop if there is an error
set -ex

# make the directory if it is not there
mkdir -p downloads

# clean the directory if there are old results
rm -f downloads/*

SEARCH_STRING="snow"
# get 5 pages
for PAGE in {1..35}
do
    # this is an example with a group
#URL='https://www.flickr.com/groups/awesomesnowflakes/pool/page'$PAGE

#URL='http://www.theiconic.co.nz/womens-shoes/?page='$PAGE
URL='http://www.theiconic.co.nz/womens-accessories-bags/?page='$PAGE


    # this is an example with tags
#URL='https://www.flickr.com/photos/tags/'$SEARCH_STRING'/page'$PAGE
#URL='http://designspiration.net/search/saves/page/'$PAGE'/?q=blue'

    echo "about to fetch URL: " $URL

    sleep 3

    # fetch the images
    wget --adjust-extension \
         --random-wait \
         --limit-rate=100k \
         --span-hosts \
         --convert-links \
         --backup-converted \
         --no-directories \
         --timestamping \
         --page-requisites \
         --directory-prefix=downloads \
         --execute robots=off \
         --accept=.jpg \
         $URL

# other unused arguments
         # --recursive \
         # --level 1 \
         # --domains en.wikipedia.org \
     
done
