#!/bin/bash

input_file="raw_data/satelite_temperature_data.csv"
output_dir="analyzed_data"
output_file="${output_dir}/highest_temp.csv"

mkdir -p "$output_dir"

if [[ ! -f "$input_file" ]]; then
    echo "Error: $input_file not found!"
    exit 1
fi

{
    head -n 1 "$input_file"  
    tail -n +2 "$input_file" | sort -t, -k2 -nr | head -n 10
} > "$output_file"

echo "Top 10 highest temperatures saved to $output_file"
