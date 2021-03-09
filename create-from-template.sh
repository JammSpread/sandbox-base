#!/bin/bash

function parse_args {
  if [[ "$@" == *"--help"* ]] || [[ "$@" == *"-h"* ]] || [[ "$@" == *"help"* ]]; then
    echo "_________________________________________________________"
		echo "|                    ===============                    |"
		echo "|                       Help Page                       |"
		echo "|                    ===============                    |"
		echo "| Desc: A script to mirror the JammSpread/sandbox-base  |"
    echo "|  — template under user/sandbox for use by the sandbox |"
    echo "|  — setup script.                                      |"
		echo "| Usage: {help | --help | -h} <user> <personal_token>   |"
		echo "|_______________________________________________________|"
		exit 0
  fi
  if [ $# -lt 2 ]; then
    echo "error Not enough arguments passed in. Please try running with '--help'."
    exit 1
  fi
  USER=$1
  TOKEN=$2
}

function create_repo {
  RESULT=$(curl -s -X POST -H "Authorization: token $TOKEN" -H "Accept: application/vnd.github.baptiste-preview+json" https://api.github.com/repos/JammSpread/sandbox-base/generate -d '{"owner": "$USER, "name":"sandbox", "private": true}')
  unset TOKEN
  [[ ! -z "$LOG" ]] && echo $RESULT > create-from-template-log.txt
  if [ RESULT == *name* ]; then
    echo "Created new repository from JammSpread/sandbox-base successfully!"
  else
    printf "Failed to create a repository from the JammSpread/sandbox-base template.\n\n"
    echo "It may have failed due to one or more of the following:"
    echo "* You may already own a repository named 'sandbox'."
    echo "* The request to GitHub may have failed."
    echo "* Your authentication token may be invalid."
  fi
  unset RESULT
}

function main {
  parse_args $@
  create_repo $@
}

main $@
