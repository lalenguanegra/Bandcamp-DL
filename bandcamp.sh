#!/bin/bash
echo "ENTER A URL";
read myInput;
curl $myInput > html.txt;
grep -o '"https://t4.bcbits.com/stream/[^"]*["},"]' html.txt | tr -d '"' > result.txt;
rm html.txt;
while read url; do wget -O Track" "$((++i)).mp3 "$url"; done < result.txt;