#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: cpp <source_file.cpp> [additional_flags]"
    exit 1
fi

# Get the source file name without the extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Set the default flags
flags="-std=c++20 -Wall -Wextra"

# Add any additional flags provided as arguments
if [ "$#" -gt 1 ]; then
    additional_flags="${@:2}"
    flags+=" $additional_flags"
fi

# Compile the C++ program
g++-11 $flags -o $filename $1
