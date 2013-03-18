#!/bin/csh
#
# for iphone:
#  - first attach/sync phone
#  - open Preview.app, menu to 'File', 'Import from iPhone', select
#      all, import to ~/Desktop/photos-import-staged
#  - close window with newly imported photos, and delete all photos
#      from iPhone through Preview.app
#
# for sd card from slr:
#  - attach through usb
#  - mv /Volumes/NO\ NAME/DCIM/1* ~/Desktop/photos-import-staged
#
# for files on android local storage, not on ext sd card:
#  - cd ~/Desktop/photos-import-staged && ~/Desktop/android-sdk-macosx/platform-tools/adb pull /storage/sdcard0/DCIM/Camera/ .
#
###
