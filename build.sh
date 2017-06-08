#!/bin/sh

#
# usage:
# > sh build.sh 1.0.0 200
#

versionNumber=$1 # 1.0.0
buildNumber=$(date +%Y%m%d%H%M%S) # 20170608172631

rm -rf build

#basicLanes="Archive_AdHoc Archive_AppStore Archive_Enterprise"
basicLanes="Archive_Enterprise"
for laneName in $basicLanes
do
fastlane $laneName version:$versionNumber build:$buildNumber
done

#channelIds="fir 91"
#for channelId in $channelIds
#do
#fastlane Channel version:$versionNumber build:$buildNumber channel_id:$channelId
#done

