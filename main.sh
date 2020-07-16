#!/bin/sh

inputurl=$1
dir=`pwd`

cd $dir

cd Chrome

docker build -t chromeimg .

cd $dir

cd Firefox
docker build -t firefoximg .

docker run -d  -p 4050 chromeimg
docker run -d -p 4051 firefoximg

cd $dir

python screenshot.py chrome {inputurl}

python screenshot.py firefox {inputurl}

# please update your s3 bucket details here

aws s3 cp "chrome_screenshot.png" "s3://bucket2test123/chrome_screenshot.png"

aws s3 presign s3://bucket2test123/chrome_screenshot.png --expires-in 1800

aws s3 cp "firefox_screenshot.png" "s3://bucket2test123/firefox_screenshot.png"

aws s3 presign s3://bucket2test123/firefox_screenshot.png --expires-in 1800
