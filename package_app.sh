#!/bin/bash
#
## Author: Steve Bennett
## Description: Package compiled JS as an Electron App.
#

# Set some defaults for electron-packager.
src='./app'
app='novella'
platform=`echo $(uname) | tr '[:upper:]' '[:lower:]'`
arch='linux'
electron_version='0.27.2'

# Determine current architecture.
case `uname -m` in
    "i386" )
        arch='i386' ;;
    "x86_64" )
        arch=x64 ;;
esac

# Get latest Electron version number from npm.
echo "Getting latest Electron build tools..."
npm install -g electron-prebuilt electron-packager
if [ $? -eq 0 ]
then
  echo "Configuring latest Electron version number..."
  electron_version=`npm show electron-prebuilt version`
else
  echo "Failed to fetch build tools." >&2
  exit 1
fi

# Run electron-packager to make a distributable app.
echo "Packaging application..."
electron-packager $src $app --platform=$platform --arch=$arch --version=$electron_version
if [ $? -eq 0 ]
then
  echo "Successfully packaged Electron app!"
  exit 0
else
  echo "Failed to package Electron app :C" >&2
  exit 1
fi

exit 0
