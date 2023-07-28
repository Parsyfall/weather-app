#!/bin/bash

if [[ -z "${API_KEY}" ]]; then
	#wtrEmoji="API_KEY isn't sett"
 	echo "Api_Key is not set";
	exit -1
fi

apiKey=$API_KEY
#locCoord="46.06667,23.58333" 	# Alba Iulia
locIP=$(curl -s ifconfig.me)
wtrJSON=$(curl -s "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$locIP")

wtrStatus=$( jq -r '.current.condition.text' <<< $wtrJSON )
city=$( jq -r '.location.name' <<< $wtrJSON )
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


#test -z $wtrStatus  && wtrEmoji="Something went wrong"
wtrEmoji="" 
case $wtrStatus in
	"Sunny")
		wtrEmoji=${emoji[sunny]}
		;;
	"Partly cloudy")
		wtrEmoji=${emoji[partly_cloudy]}
		;;
	"Patchy light rain" | "Patchy light drizzle" | "Light drizzle")
		wtrEmoji=${emoji[sunshower]}
		;;
	"Light rain" | "Moderate rain at times" | "Moderate rain" \
	| "Moderate or heavy rain shower" |  "Torrential rain shower")
		wtrEmoji=${emoji[rain]}
		;;
	"Moderate or heavy rain with thunder" | "Patchy light rain with thunder" \
	| "Thundery outbreaks possible")
		wtrEmoji=${emoji[thunderstorm]}
		;;
	"Light snow" | "Patchy light snow" | "Patchy moderate snow" | "Moderate snow" \
	| "Patchy heavy snow" | "Patchy heavy snow" | "Heavy snow")
		wtrEmoji=${emoji[snow]}
		;;
	"Fog")
		wtrEmoji=${emoji[fog]}
		;;
	*)
		wtrEmoji=${emoji[sad]}
esac

echo "Hello ${USER},"
echo "Current weather in ${city}: ${wtrStatus} ${wtrEmoji}"