#!/bin/bash

filename=$1
cols=$2
outlierCol=$3
option=$4

# Remove trailing spaces and newlines
awk '{ gsub(/^[ \t]+|[ \t]+$/, "", $0); print }' "$filename" > missing.csv

# Remove rows with missing values
awk -F',' -v option="$option" '{
    missing = 0
    for (i=1; i<=NF; i++) {
        if ($i == "" && option == 0) {
            missing = 1 
            break 
        }
	else if ($i == "" && option == 1) {
	    $i="NA"
	}
    }
    if (missing == 0 && option == 0) {
        print $0
    }
    else if (option == 1) {
        print $0
    }
}' OFS=',' missing.csv > cleaned.csv

# Remove duplicates
sort -u -n -t',' -k1 cleaned.csv > unique.csv

# Handle outliers
cut -d',' -f$outlierCol unique.csv | sort -nu > field_values.txt
num_rows=$(wc -l < field_values.txt)

q1_pos=$((num_rows / 4))
q1_pos=$((num_rows / 2))
q3_pos=$((num_rows * 3 / 4))


q1=$(awk -v pos="$q1_pos" 'NR==pos {print $1}' field_values.txt)
q2=$(awk -v pos="$q2_pos" 'NR==pos {print $1}' field_values.txt)
q3=$(awk -v pos="$q3_pos" 'NR==pos {print $1}' field_values.txt)

#echo $q1
#echo $q3

iqr=$(echo "$q3 - $q1" | bc)
lower=$(echo "$q1 - 1.5 * $iqr" | bc)
upper=$(echo "$q3 + 1.5 * $iqr" | bc)

#echo $lower
#echo $upper


# Remove outliers
awk -F, -v outlierCol="$outlierCol" -v lower="$lower" -v upper="$upper" '
    $outlierCol >= lower && $outlierCol <= upper {
        print $0
    }
' cleaned.csv > final.csv

