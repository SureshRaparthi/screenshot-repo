#!/bin/sh

inputurl=$1
dir=`pwd`

cd $dir

cd Chrome

docker build -t chromeimg .

cd $dir

cd Firefox
docker build -t firefoximg .

docker run -d  -p 4444:4444 chromeimg
docker run -d -p 4445:4445 firefoximg

cd $dir

sleep 20

python3 screenshot.py chrome $inputurl

#sleep 20

#python3 screenshot.py firefox $inputurl

# please update your s3 bucket details here

aws s3 cp "chrome_screenshot.png" "s3://bucket2test123/chrome_screenshot.png"
sleep 10
aws s3 presign s3://bucket2test123/chrome_screenshot.png --expires-in 1800

#aws s3 cp "firefox_screenshot.png" "s3://bucket2test123/firefox_screenshot.png"

#aws s3 presign s3://bucket2test123/firefox_screenshot.png --expires-in 1800
