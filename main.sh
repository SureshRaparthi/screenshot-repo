#!/bin/sh

inputurl=$1
dir=`pwd`

cd $dir

cd Chrome

docker build -t chromeimg .

cd $dir

cd Firefox
docker build -t firefoximg .

docker run  -p 4050 chromeimg
docker run  -p 4051 firefoximg

python screenshot.py chrome {inputurl}

python screenshot.py firefox {inputurl}

# please update your s3 bucket details here

aws s3 cp "chrome_screenshot.png" "s3://bucket2test123/chrome_screenshot.png" --region=ap-south-1 --output=json

aws s3 presign s3://test-bucket/chrome_screenshot.png --expires-in 1800

aws s3 cp "firefox_screenshot.png" "s3://bucket2test123/firefox_screenshot.png" --region=ap-south-1 --output=json

aws s3 presign s3://test-bucket/firefox_screenshot.png --expires-in 1800
