#!/bin/bash
#
#translates markdown to html, then loads it in lynx
#usage: mdlynx.sh file.md

lynx -force_html <(markdown $1)
