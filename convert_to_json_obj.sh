#!/bin/bash

# Check if the input file and output file are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.json output.json"
    exit 1
fi

input_file=$1
output_file=$2

# Read the JSON array from the input file
json_array=$(cat "$input_file")

# Convert the JSON array into the desired format
json_object=$(echo "$json_array" | jq -r '[
    .[] |
    { (gsub(" "; "_") | ascii_upcase): . }
] | add')

# Write the output to the output file
echo "$json_object" > "$output_file"

echo "Conversion completed. Output written to $output_file"
