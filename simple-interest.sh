#!/bin/bash

# Function to calculate simple interest
calculate_simple_interest() {
    principal=$1
    rate=$2
    time=$3

    # Calculate simple interest
    interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

    echo "The simple interest is: $interest"
}

# Check if the user has provided all three arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 principal rate time"
    exit 1
fi

# Read the arguments
principal=$1
rate=$2
time=$3

# Validate the arguments to ensure they are positive numbers
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: All inputs must be positive numbers."
    exit 1
fi

# Call the function to calculate simple interest
calculate_simple_interest $principal $rate $time
