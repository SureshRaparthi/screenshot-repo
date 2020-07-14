#!/bin/sh

inputurl = $1
dir=`pwd`

cd $dir

cd Chrome

docker build -t chromeimg .

cd $dir

cd Firefox
docker build -t firefoximg .

docker run chromeimg --port 4050
docker run firefoximg --port 4051

screenshot.py chrome {inputurl}

screenshot.py firefox {inputurl}

# please update you s3 bucket here

aws s3 cp "chrome_screenshot.png" "s3://bucket2test123/chrome_screenshot.png" --region=ap-south-1 --output=json

aws s3 presign s3://test-bucket/chrome_screenshot.png --expires-in 1800

aws s3 cp "firefox_screenshot.png" "s3://bucket2test123/firefox_screenshot.png" --region=ap-south-1 --output=json

aws s3 presign s3://test-bucket/firefox_screenshot.png --expires-in 1800
