#!/bin/bash

if [[ -z "${API_KEY}" ]]; then
	echo "API_KEY isn't sett"
	exit -1
fi

apiKey=$API_KEY
locCoord="46.06667,23.58333" 	# Alba Iulia
curl "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$locCoord" > w.json

wtrStatus=$( cat w.json | jq -r '.current.condition.text' )
declare -A emoji=(
	[happy]=😀
	[sad]=🙁
	[sunny]=🌞
	[partly_cloudy]=⛅
	[sunshower]=🌦
	[rain]=🌧
	[snow]=🌨
	[thunderstorm]=🌩
	[fog]=🌫
)
#echo "weather status: $wtrStatus"
#test -z $wtrStatus  && echo "Something went wrong"
case $wtrStatus in
	"Sunny")
		echo ${emoji[sunny]}
		;;
	"Partly cloudy")
		echo ${emoji[partly_cloudy]}
		;;
	"Patchy light rain" | "Patchy light drizzle" | "Light drizzle")
		echo ${emoji[sunshower]}
		;;
	"Light rain" | "Moderate rain at times" | "Moderate rain")
		echo ${emoji[rain]}
		;;
	"Moderate or heavy rain with thunder" | "Patchy light rain with thunder")
		echo ${emoji[thunderstorm]}
		;;
	"Light snow" | "Patchy light snow" | "Patchy moderate snow" | "Moderate snow" \
	| "Patchy heavy snow" | "Patchy heavy snow" | "Heavy snow")
		echo ${emoji[snow]}
		;;
	"Fog")
		echo ${emoji[fog]}
		;;
	*)
		echo ${emoji[sad]}
esac

#rm w.json
