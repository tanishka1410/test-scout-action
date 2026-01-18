# Base image
FROM ubuntu:22.04

# Install required tools
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script into the container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Run the script when the action starts
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
