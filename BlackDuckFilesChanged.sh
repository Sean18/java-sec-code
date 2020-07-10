#!/bin/bash

# Create arr with file extensions to trigger Black Duck scan

arr=(
"compile_commands.json"
"Podfile.lock"
"environment.yml"
"Makefile.PL"
"packrat.lock"
"Gopkg.lock"
"gogradle.lock"
"go.mod"
"vendor/vendor.json"
"vendor.conf"
"build.gradle"
"build.gradle.kts"
"rebar.config"
"pom.xml"
"pom.groovy"
"package.json"
"package-lock.json"
"npm-shrinkwrap.json"
"composer.lock"
"composer.json"
"package.xml"
"Pipfile.lock"
"setup.py"
"Gemfile.lock"
"build.sbt"
"Package.swift"
"yarn.lock") 

# Get files changed from git project

OUTPUT=($(git show --name-only --oneline))

echo "Looking for changed files in" $(pwd)

# Check to see if any of the changed files should trigger a Black Duck scan

for i in "${OUTPUT[@]}"
do
    for j in "${arr[@]}"
    do
        if [[ "$j" =~ "$i" ]]; then
            echo "$i was changed, Black Duck scan should run"
            exit 1
        fi
    done

done 

# Check each element in array

echo "No files which trigger Black Duck SCA have been found."
exit 0