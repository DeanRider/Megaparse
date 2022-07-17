# Megaparse
Parses mpile files to get counts of indels and mutations

This script will scan a folder to create a list of input mpile files.
It will then use each file in the list it created
and manipulate field 5 to separate characters.
Each character represents a match or mismatch type. 
awk will determine the counts of indels and matches; mismatch 
is the difference between depth and matches.

The data will then be printed out on a per line basis.


use: bash MegaParse.sh


written July 4, 2022 by S. Dean Rider Jr. based on the following:
https://www.unix.com/unix-for-dummies-questions-and-answers/179555-count-different-characters-one-column.html
answer by scrutinizer
and
https://www.xmodulo.com/read-column-data-text-file-bash.html
