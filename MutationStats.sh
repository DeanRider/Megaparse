#!/bin/bash
#######################################################################
#
# Script for selecting out all non chromosomal site data for easier
# graph making in excel as summed / % or xy on a per 1000 read basis
# uses output made by Megaparse 2.1, helps to analyze ectopic sites
# December 14, 2022 by S. Dean Rider Jr.
# 
#######################################################################

# scan directory structure for results and store as a list
find . -name "*newCounts.txt" -type file -exec echo '{}' >> newCountslist.txt \;
find . -name "*perThousand.txt" -type file -exec echo '{}' >> perThousandlist.txt \;


while read fileref; do

echo $fileref

echo $'LOCATION\tPOSITION\tBASE\tDEPTH\tPOSITION\tMATCHES\tPOSITION\tINSERTION_EVENTS\tPOSITION\tDELETION_EVENTS\tPOSITION\tDELETIONS\tPOSITION\tMISMATCH_CALC' > $fileref.noChr.txt
grep -iv 'chr*' $fileref >> $fileref.noChr.txt

echo -e "\033[1;34m -. .-.   .-. .-.   .-. .-.   .-. .-.   .-. .-.   .-. .-.   .\033[0m";
echo -e "\033[1;30m ||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|\033[0m";
echo -e "\033[1;30m |/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\||\033[0m";
echo -e "\033[1;31m ~   \`-~ \`-\`   \`-~ \`-\`   \`-~ \`-~   \`-~ \`-\`   \`-~ \`-\`   \`-~ \`-\033[0m";


done < "perThousandlist.txt"




while read fileref; do

echo $fileref
# get the filename without the file path and call it $base
base=$(basename "$fileref")
echo $base >> MutationSummaryStatsECT.txt
echo $'Frequencies are in percentages' >> MutationSummaryStatsECT.txt
echo $'Total_Bases\tTotal_insertions\tTotal_Del_events\tTotal_Deletions\tTotal_mismatches\tInsertion_freq\tDel_event_freq\tDel_frequency\tMismatch_frequency' >> MutationSummaryStatsECT.txt
awk 'BEGIN{OFS="\t"}!/chr/{sum4+=$4; sum8+=$8; sum10+=$10; sum12+=$12; sum14+=$14;} END{print sum4, sum8, sum10, sum12, sum14, sum8/sum4*100, sum10/sum4*100, sum12/sum4*100, sum14/sum4*100 }' $fileref >> MutationSummaryStatsECT.txt
echo "" >> MutationSummaryStatsECT.txt


echo -e "\033[1;34m -. .-.   .-. .-.   .-. .-.   .-. .-.   .-. .-.   .-. .-.   .\033[0m";
echo -e "\033[1;30m ||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|||\|||\ /|\033[0m";
echo -e "\033[1;30m |/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\|||/ \|||\||\033[0m";
echo -e "\033[1;31m ~   \`-~ \`-\`   \`-~ \`-\`   \`-~ \`-~   \`-~ \`-\`   \`-~ \`-\`   \`-~ \`-\033[0m";


done < "newCountslist.txt"


echo
echo
echo
echo -e "\033[1;31m ▄▄▄▄▄▄▄▄     ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄ \033[0m";
echo -e "\033[1;31m▐░░░░░░░░▌   ▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌\033[0m";
echo -e "\033[1;31m▐░█▀▀▀▀▀█░▌  ▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ \033[0m";
echo -e "\033[1;31m▐░▌      ▐░▌ ▐░▌       ▐░▌▐░▌▐░▌    ▐░▌▐░▌          \033[0m";
echo -e "\033[1;31m▐░▌       ▐░▌▐░▌       ▐░▌▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ \033[0m";
echo -e "\033[1;31m▐░▌       ▐░▌▐░▌       ▐░▌▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌\033[0m";
echo -e "\033[1;31m▐░▌       ▐░▌▐░▌       ▐░▌▐░▌   ▐░▌ ▐░▌▐░█▀▀▀▀▀▀▀▀▀ \033[0m";
echo -e "\033[1;31m▐░▌      ▐░▌ ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌▐░▌          \033[0m";
echo -e "\033[1;31m▐░█▄▄▄▄▄█░▌  ▐░█▄▄▄▄▄▄▄█░▌▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ \033[0m";
echo -e "\033[1;31m▐░░░░░░░░▌   ▐░░░░░░░░░░░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌\033[0m";
echo -e "\033[1;31m ▀▀▀▀▀▀▀▀     ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀ \033[0m";
echo -e "\033[1;31m                                                    \033[0m";



exit 0



