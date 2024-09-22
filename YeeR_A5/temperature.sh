#!/bin/bash
temp=$1

if [ $temp -gt 55 ]; then
	if [ $temp -gt 67 ]; then
	        if [ $temp -gt 85 ]; then
			echo "hot"
		else
			echo "nice"
		fi
	else
        	echo "cold"
	fi
else
        echo "freezing"
fi
