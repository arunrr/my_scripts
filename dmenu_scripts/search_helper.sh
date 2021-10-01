#!/usr/bin/env bash

# A script that helps to search given keywords through different search engines

# Specify browser to use
browser=qutebrowser

# Web protocol
web_protocol=https://www

# Add required search engine urls
declare -A search_engines

search_engines+=(['Google']=$web_protocol.google.com/search?q=
		 ['Amazon']=$web_protocol.amazon.com/s?k=
		 ['Metager']=$web_protocol.metager.org/meta/meta.ger3?eingabe=
		 ['DuckGo']=$web_protocol.duckduckgo.com/?q=
		 ['Youtube']=$web_protocol.youtube.com/results?search_query=

		)

# Get a search engine from dmenu
search_engine=$(for key in "${!search_engines[@]}"
		do
		  echo $key
		done | dmenu -i -l 10 -p 'Search in') || exit 1

# Get keywords to search from dmenu
search_term=$(echo $selected_search_engine | dmenu -p 'Enter search term')

# If search term is empty exit
if [ -z $search_term ];then
	exit 0
fi


# Open the search engine with given keyword in specified browser
if [ -v search_engines[$search_engine] ];then
	$browser ${search_engines[$search_engine]}$search_term
fi
