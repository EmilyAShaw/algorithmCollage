#!/bin/bash

if [ ! -d "/usr/local/anaconda/extras" ]; then
  # Control will enter here if DIRECTORY doesn't exist.
  echo "smartgrid program not found"
  echo "please first install using directions on blackboard"
  exit 1
fi

# show commands and stop if there is an error
set -ex

HOME="/usr/local/anaconda/extras/home"
export PATH="/usr/local/anaconda/bin:$PATH"

python /usr/local/anaconda/extras/smartgrid.py \
  --tile 25x16 \
  --input-glob 'resized/*' \
--left-image 'resized/http%2F%2Fstatic.theiconic.com.au%2Fp%2Fnaked-vice-0231-592394-1.jpg' \
  --right-image 'resized/http%2F%2Fstatic.theiconic.com.au%2Fp%2Ftoms-0231-288784-1.jpg' \
  --output-path customgrid

