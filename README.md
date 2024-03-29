# Megaparse
Parses mpileup files to get counts of indels and mutations

This script will scan a directory to create a list of input pileup.txt files generated by Megamap/quickmap using samtools (contains pile.txt in the filename).
It will then use each file in the list it created
and manipulate field 5 to count characters.
Each character represents a match or mismatch type. 
awk will determine the counts of indels and matches; mismatch 
is the difference between depth and matches + deleted bases.

The data will then be printed out on a per line basis (e.g. each reference position). Summary report data is listed as:

LOCATION POSITION BASE DEPTH POSITION MATCHES POSITION INSERTION_EVENTS POSITION DELETION_EVENTS POSITION DELETIONS POSITION MISMATCH_CALC

The script then invokes a perl script called pileup2baseindel.pl written by Jiang Li (https://github.com/riverlee/pileup2base) to generate a more detailed report that includes counts of each type of base and strings representing the individual insertions or deletions.


use: bash Megaparse2.1.sh


written July 4, 2022 by S. Dean Rider Jr. based on the following:
https://www.unix.com/unix-for-dummies-questions-and-answers/179555-count-different-characters-one-column.html
answer by scrutinizer
and
https://www.xmodulo.com/read-column-data-text-file-bash.html

revised December 6, 2022

