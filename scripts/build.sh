#!/bin/bash

#
## build.sh
## Author: Steve Bennett
## Description: Build Dart app as compiled JS.
#
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
root_dir=$dir/..

# Move up a level to the project root.
cd $root_dir

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
# Code below reads the top of package.json and replaces 3rd ',' with a '}'.
# This gives us the minimal metadata entries for an Electron app.
#echo "$(head -n 4 ./package.json)EOF" | sed 's/,EOF/\}/' > ./build/web/package.json
if [[ ! -e "./package.json" ]];then
  echo "No package.json found..."
  echo "Running jsonGenerator..."
  pub run novella:jsonGenerator --file ./pubspec.yaml > ./build/web/package.json
  if [[ $? -ne 0 ]];then
    echo "pub bin not found..."
    echo "attempting to activate..."
    pub global activate --source path . && pub run novella:jsonGenerator --file ./pubspec.yaml > ./build/web/package.json
    if [[ $? -ne 0 ]];then
      echo "Failed... exiting."
      exit 1
    fi
  fi
else
  echo "$(head -n 4 ./package.json)EOF" | sed 's/,EOF/\}/' > ./build/web/package.json
  echo "package.json copied to source area."
fi

# 2) main.js
echo "Looking for main.js..."
if [ -e "./lib/main.js" ]; then
  echo "./lib/main.js found!  Copying to ./build/web..."
  cp ./lib/main.js ./build/web
fi

echo "Build ready."
exit 0
