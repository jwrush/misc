#!/bin/bash
 xclip -o | sed -n -e 's/.*[\/-]\([0-9a-zA-Z]\{18,\}\).*/https:\/\/media.giphy.com\/media\/\1\/giphy.gif/p' && printf "\n"
