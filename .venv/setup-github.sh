#!/bin/bash

# Function to switch GitHub account
switch_account() {
    echo "Current GitHub account:"
    gh auth status

    read -p "Do you want to switch to a different GitHub account? (y/n): " switch_choice
    if [[ $switch_choice == "y" || $switch_choice == "Y" ]]; then
        gh auth login
    fi
}

# Check if the GitHub CLI is installed
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI is not installed. Please install it first."
    echo "You can install it using Homebrew: brew install gh"
    exit 1
fi

# Check if user is authenticated with GitHub CLI
if ! gh auth status &> /dev/null
then
    echo "You're not authenticated with GitHub CLI. Please run 'gh auth login' first."
    exit 1
fi

# Option to switch GitHub account
switch_account

# Get the current directory name
repo_name=$(basename "$PWD")

# Prompt for organization name
read -p "Enter the organization name (leave blank for personal account): " org_name

# Check if git is initialized
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
fi

# Create .gitignore if it doesn't exist
if [ ! -f .gitignore ]; then
    echo "Creating .gitignore file..."
    touch .gitignore
fi

# Add all files and commit
git add .
git commit -m "Initial commit"

# Create GitHub repository
echo "Creating GitHub repository '$repo_name'..."
if [ -z "$org_name" ]; then
    gh repo create "$repo_name" --public --source=. --remote=origin --push
else
    gh repo create "$org_name/$repo_name" --public --source=. --remote=origin --push
fi

echo "Repository created and code pushed successfully!"

# Set up local Git configuration
read -p "Do you want to set up local Git configuration for this repository? (y/n): " config_choice
if [[ $config_choice == "y" || $config_choice == "Y" ]]; then
    read -p "Enter your name for this repository: " git_name
    read -p "Enter your email for this repository: " git_email
    git config user.name "$git_name"
    git config user.email "$git_email"
    echo "Local Git configuration set up successfully!"
fi