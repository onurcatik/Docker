#!/bin/bash

# Script to install Docker Desktop on macOS using Homebrew


# Step 1: Install Docker using Homebrew
echo "Installing Docker Desktop..."
brew install --cask docker

# Step 2: Start Docker Desktop
echo "Starting Docker Desktop..."
open /Applications/Docker.app

# Step 3: Verify the installation
echo "Waiting for Docker to start..."
while ! command -v docker &>/dev/null; do
  sleep 2
done

echo "Docker is installed successfully!"
docker --version

# Function to ensure Docker is running
ensure_docker_running() {
  echo "Waiting for Docker daemon to be ready..."
  while (! docker stats --no-stream >/dev/null 2>&1); do
    sleep 2
  done
  echo "Docker daemon is running."
}

# Ensure Docker daemon is running
ensure_docker_running

echo "Docker installation and setup complete."
