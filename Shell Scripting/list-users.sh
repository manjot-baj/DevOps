#!/bin/bash

################################

# Author: Manjot
# Date: 24th-August-2024
# Version: v1
# About : This Script list the name of contributors on a given Github Repo
# Note: You need to export username and token of your github account before executing the script

################################

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"
    #collaborators="$(github_api_get "$endpoint")"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Function to check if the user is executing the script with the required cmd args
function helper {
    expected_cmd_args=2
    if [ $# -ne $expected_cmd_args ]; then
        echo "ERROR: Please execute the script with the required cmd args"
        echo "Provide Repo_Owner and Repo_Name, e.g., './script_name.sh REPO_OWNER REPO_NAME'"
	exit 1
    fi
}

# Main script
helper "$@"

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
