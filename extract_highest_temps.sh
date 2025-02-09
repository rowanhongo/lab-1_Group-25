#!/bin/bash

# Define input and output files
input_file="raw_data/satelite_temperature_data.csv"
output_dir="analyzed_data"
output_file="${output_dir}/highest_temp.csv"

# Create the analyzed_data directory if it doesn't exist
mkdir -p "$output_dir"

# Check if the input file exists
if [[ ! -f "$input_file" ]]; then
    echo "Error: $input_file not found!"
    exit 1
fi

# Extract the top 10 highest temperatures
{
    head -n 1 "$input_file"  # Print the header
    tail -n +2 "$input_file" | sort -t, -k2 -nr | head -n 10  # Sort and get top 10
} > "$output_file"

echo "Top 10 highest temperatures saved to $output_file"
