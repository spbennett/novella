#!/bin/bash

#
## build.sh
## Author: Steve Bennett
## Description: Build Dart app as compiled JS.
#

echo "Blowing away old builds..."
if [ -d "./build" ]; then
  rm -rf ./build
fi

# Pub is a package manager for Dart.  Run pub to fetch dependencies.
echo 'Fetching dependencies...'
pub get

# Compile the app into JS to run in a browser.
echo "Compiling Dart to JS..."
pub build

# Copy the Electron components to the Dart build.
echo "Copying Electron essentials to build dir..."
# 1) package.json
# Replace 3rd , with a }
echo "Generating package.json..."
echo "$(head -n 4 ./package.json)EOF" | sed 's/,EOF/\}/' > build/web/package.json
# 2) main.js
echo "Copying main.js to build..."
cp ./lib/main.js ./build/web

echo "Build ready."
exit 0
