#!/bin/bash
echo "ENTER A URL";
read myInput;
curl $myInput > html.txt;
sed -i 's/,/\n/g' html.txt
grep -o 'https://t4.bcbits.com/stream/[^"]*[";}"]' html.txt > result.txt
sed -i 's/;}/\n/g' result.txt
rm html.txt;
awk 'NF' result.txt > results.txt
while read url; do wget -O Track" "$((++i)).mp3 "$url"; done < results.txt;
rm result.txt
