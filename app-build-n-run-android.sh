#!/bin/sh
npm install
ionic build
ionic cap add android
cordova-res android --skip-config --copy
ionic cap run android
adb reverse tcp:8091 tcp:8091 
