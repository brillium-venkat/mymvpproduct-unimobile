call npm install
call ionic build
call ionic cap add android
call cordova-res android --skip-config --copy
call ionic cap run android
call adb reverse tcp:8091 tcp:8091 