#!/bin/bash
#
## Author: Steve Bennett
## Description: Package compiled JS as an Electron App.
#

# Set some defaults for electron-packager.
src='./build/web'
dist='./dist'
app='novella'

# Determine current platform.
# Allowed: linux, win32, darwin
platform=`echo $(uname) | tr '[:upper:]' '[:lower:]'`
if [ "$platform" != 'darwin' -a "$platform" != 'linux' ];then
  echo "Platform is probably Windows."
  platform='win32'
fi

# Determine current architecture.
case `uname -m` in
    "i386" )
        arch='i386' ;;
    "x86_64" )
        arch=x64 ;;
    * )
        arch=x64 ;;
esac

echo "Cleaning workspace..."
rm -rf ./dist/

# Ensure electron-packager is installed.
echo "Checking for Electron build tools..."
npm -g list electron-packager
if [ $? -ne 0 ];then
  echo "No Electron build tools found..."
  npm install -g electron-packager
  if [ $? -ne 0 ];then
    echo "Failed to fetch build tools." >&2
    exit 1
  fi
else
  echo "Build tools found!"
fi

# Get latest Electron version number from npm.
echo "Configuring latest Electron version number..."
electron_version=`npm show electron-prebuilt version`

# Run electron-packager to make a distributable app.
echo "Packaging application..."
electron-packager $src $app --platform=$platform --arch=$arch --version=$electron_version --out=$dist
if [ $? -eq 0 ]
then
  echo "Successfully packaged Electron app!"
  exit 0
else
  echo "Failed to package Electron app :C" >&2
  exit 1
fi

exit 0
