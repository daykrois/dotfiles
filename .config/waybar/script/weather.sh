#!/bin/bash
# 替换为你所在的城市
city="Beijing"
weather=$(curl -s "wttr.in/$city?format=3")
echo "$weather"
