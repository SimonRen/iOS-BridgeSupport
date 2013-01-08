#/bin/bash

rm -rf output
mkdir output

FILES=/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS5.0.sdk/System/Library/Frameworks/*
for f in $FILES
do
    echo "`basename "$f"`"
    rm -rf "./output/`basename "$f"`"
    mkdir "./output/`basename "$f"`/"
    mkdir "./output/`basename "$f"`/Resources"
    mkdir "./output/`basename "$f"`/Resources/BridgeSupport"

	gen_bridge_metadata --framework "$f" --output "./output/`basename "$f"`/Resources/BridgeSupport/`basename "$f" .framework`.bridgesupport" > /dev/null 2>&1
done
