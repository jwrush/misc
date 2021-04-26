#!/bin/bash

for x in $(seq 7); 
   do tput setaf $x; 
   printf 'test tput setaf '"$x"'\r\n'; 
   tput sgr0; 
done;

for x in $(seq 7); 
   do tput setab $x; 
   printf 'test tput setab '"$x"'\r\n'; 
   tput sgr0; 
done;
