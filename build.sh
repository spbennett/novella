#!/bin/bash

#
## build.sh
## Author: Steve Bennett
## Description: Build Dart app as compiled JS.
#

# Pub is a package manager for Dart.  Run pub to fetch dependencies.
#echo 'Fetching dependencies...'
pub get

# Compile the app into JS to run in a browser.
pub build

# Copy the Electron components to the Dart build.
# 1) package.json
# Replace 3rd , with a }
dart ./dart_strings.dart > ./build/web/package.json
# 2) main.js
cp ./lib/main.js ./build/web
