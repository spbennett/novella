#!/bin/bash

#
## package_app.sh
## Author: Steve Bennett
## Description: Package compiled JS as an Electron App.
#

src='./app'
app='novella'
platform=`echo $(uname) | tr '[:upper:]' '[:lower:]'`
case `uname -m` in
    "i386" )
        arch='i386' ;;
    "x86_64" )
        arch=x64 ;;
esac
electron_version=`npm show electron-prebuilt version`

electron-packager $src $app --platform=$platform --arch=$arch --version=$electron_version
