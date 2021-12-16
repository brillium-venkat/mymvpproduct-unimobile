#!/bin/sh
#  app-build-n-run-ios.sh
#  AppBrahma iOS App building - MacOS development environment check automation
#
#  Created by Venkateswar Reddy Melachervu on 13/12/21.
#
# OS version validation
# echo "MacOS version is : $(/usr/bin/sw_vers -productVersion)"
# Minimum version required is Big Sur - 11.0.1 due to Xcode 12+ requirement for ionic capacitor
# Required version values
OS_MAJOR_VERSION=10
OS_MINOR_VERSION=0
OS_PATCH_VERSION=1
XCODE_MAJOR_VERSION=11
XCODE_MINOR_VERSION=0
XCODE_PATCH_VERSION=1
NODE_MAJOR_VERSION=v12
NPM_MAJOR_VERSION=6
XCODE_SELECT_MIN_VERSION=2300
COCOAPODS_MAJOR_VERSION=1
IONIC_CLI_MAJOR_VERSION=6
IONIC_CLI_MINOR_VERSION=16

if [[ $(/usr/bin/sw_vers -productVersion | awk -F. '{ print $1 }') -ge $OS_MAJOR_VERSION ]]; then
    if [[ $(/usr/bin/sw_vers -productVersion | awk -F. '{ print $2 }') -ge $OS_MINOR_VERSION ]]; then
        if [[ $(/usr/bin/sw_vers -productVersion | awk -F. '{ print $3 }') -ge $OS_PATCH_VERSION ]]; then
            echo "MacOS version requirement - $OS_MAJOR_VERSION.$OS_MINOR_VERSION.$OS_PATCH_VERSION - met, moving ahead with other checks..."
        else
            echo "You are running non-supported MacOS version $(/usr/bin/sw_vers -productVersion) for building and running AppBrahma generated Unimobile application project sources!"
            echo "Minimum required version is $OS_MAJOR_VERSION.$OS_MINOR_VERSION.$OS_PATCH_VERSION"
            echo "Aborting the build process!"
            exit 1
        fi
    else
        echo "You are running non-supported MacOS version $(/usr/bin/sw_vers -productVersion) for building and running AppBrahma generated Unimobile application project sources!"
        echo "Minimum required version is $OS_MAJOR_VERSION.$OS_MINOR_VERSION.$OS_PATCH_VERSION"
        echo "Aborting the build process!"
        exit 1
    fi
else
    echo "You are running non-supported MacOS version $(/usr/bin/sw_vers -productVersion) for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $OS_MAJOR_VERSION.$OS_MINOR_VERSION.$OS_PATCH_VERSION"
    echo "Aborting the build process!"
    exit 1
fi

# Xcode version validation
if [[ $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}' | awk -F. '{print $1}') -ge XCODE_MAJOR_VERSION ]]; then
    if [[ $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}' | awk -F. '{print $2}') -ge XCODE_MINOR_VERSION ]]; then
        if [[ $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}' | awk -F. '{print $3}') -ge XCODE_PATCH_VERSION ]]; then
            echo "Xcode version requirement - $XCODE_MAJOR_VERSION.$XCODE_MINOR_VERSION.$XCODE_PATCH_VERSION - met, moving ahead with other checks..."
        else
            echo "You are running non-supported Xcode version $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}') for building and running AppBrahma generated Unimobile application project sources!"
            echo "Minimum required version is $XCODE_MAJOR_VERSION.$XCODE_MINOR_VERSION.$XCODE_PATCH_VERSION"
            echo "Aborting the build process!"
            exit 1
        fi
    else
        echo "You are running non-supported Xcode version $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}') for building and running AppBrahma generated Unimobile application project sources!"
        echo "Minimum required version is $XCODE_MAJOR_VERSION.$XCODE_MINOR_VERSION.$XCODE_PATCH_VERSION"
        echo "Aborting the build process!"
        exit 1
    fi
else
    echo "You are running non-supported Xcode version $(/usr/bin/xcodebuild -version | awk 'NR==1{print $2}') for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $XCODE_MAJOR_VERSION.$XCODE_MINOR_VERSION.$XCODE_PATCH_VERSION"
    echo "Aborting the build process!"
    exit 1
fi

# xcode-select command tools verification
if [[ $(xcode-select --version | awk '{ print $3 }') < $XCODE_SELECT_MIN_VERSION ]]; then
    echo "You are running non-supported xcode-select version $(xcode-select --version | awk '{ print $3 }' | awk -F. '{ print $1 }') for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $XCODE_SELECT_MIN_VERSION+"
    echo "Aborting the build process!"
    exit 1
else
    echo "xcode-select requirement met, moving ahead with other checks..."
fi

# Node validation
if [[ $(node --version | awk -F. '{ print $1 }') < $NODE_MAJOR_VERSION ]]; then
    echo "You are running non-supported Node major version $(node --version | awk -F. '{ print $1 }') for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $NODE_MAJOR_VERSION+"
    echo "Aborting the build process!"
    exit 1
else
    echo "Node version requirement met, moving ahead with other checks..."
fi

# NPM validation
if [[ $(npm --version | awk -F. '{ print $1 }') < $NPM_MAJOR_VERSION ]]; then
    echo "You are running non-supported NPM major version $(npm --version | awk -F. '{ print $1 }') for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $NPM_MAJOR_VERSION+"
    echo "Aborting the build process!"
    exit 1
else
    echo "NPM requirement met, moving ahead with other checks..."
fi

# cocoapods install check
if [[ $(pod --version | awk -F. '{ print $1 }') < $COCOAPODS_MAJOR_VERSION ]]; then
    echo "Cocoapods is not installed or a non-supported version $(pod --version | awk -F. '{ print $1 }') is running for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $COCOAPODS_MAJOR_VERSION+"
    echo "Aborting the build process!"
    exit 1
else
    echo "Cocoapods requirement met, moving ahead with other checks..."
fi

# ionic cli version validation
if [[ $(ionic --version | awk -F. '{ print $1 }') -lt $IONIC_CLI_MAJOR_VERSION ]]; then
    echo "You are running non-supported Ionic CLI major version $(ionic --version | awk -F. '{ print $1 }') for building and running AppBrahma generated Unimobile application project sources!"
    echo "Minimum required version is $IONIC_CLI_MAJOR_VERSION+"
    echo "Aborting the build process!"
    exit 1
else
    echo "Ionic CLI requirement met, moving ahead with other checks..."
fi

# update capacitor cli core
echo "Updating capacitor CLI core..."
npm install @capacitor/cli@latest @capacitor/core@latest

echo "AppBrahma build environment validation completed successfully. Moving ahead with building."
echo "Installing node dependencies..."
npm install
echo "Building the project using ionic build..."
ionic build
echo "Adding capacitor iOS platform"
ionic cap add ios
echo "Customizing the application icon and splash for iOS..."
cordova-res ios --skip-config --copy
echo "Starting iOS simulator for running the app..."
ionic cap run ios
