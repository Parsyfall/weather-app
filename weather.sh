#!/bin/bash

apiKey=
locCoord="46.06667,23.58333"
curl "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$locCoord" > w.json

wtrStatus=$( cat w.json | jq -r '.current.condition.text' )
goodwtr=😀
badwtr=🙁
#echo "weather status: $wtrStatus"
#test -z $wtrStatus  && echo "Something went wrong"
if [ "$wtrStatus" == "Sunny" ]; then
	echo $goodwtr
else
	echo $badwtr
fi

rm w.json
