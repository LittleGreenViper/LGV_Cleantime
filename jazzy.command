#!/bin/sh
CWD="$(pwd)"
MY_SCRIPT_PATH=`dirname "${BASH_SOURCE[0]}"`
cd "${MY_SCRIPT_PATH}"

echo "Creating Docs for the LGV_Cleantime Library\n"
rm -drf docs/*

jazzy  --readme ./README.md \
       --github_url https://github.com/LittleGreenViper/LGV_Cleantime \
       --title "NA Cleantime Calculation Engine Doumentation" \
       --min_acl public \
       --theme fullwidth
cp ./icon.png docs/
