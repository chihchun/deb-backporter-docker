#!/bin/sh

# Build Docker images for each folder
for dir in */ ; do
    if [ -f "$dir/Dockerfile" ]; then
        image_name="chihchun/deb-backporter:${dir%/}"
        echo "Building Docker image: $image_name"
        docker build -t "$image_name" "$dir"
    fi
done