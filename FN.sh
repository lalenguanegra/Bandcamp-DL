#!/bin/bash
echo "ENTER A URL";
read myInput;
curl $myInput > html.txt;
grep -o '"title":"[^"]*['\",\"encoding_pending\":']' html.txt | tr -d '"' > result.txt;
sed -i '1d' result.txt;
sed "s/title:*/""/g" result.txt > filenames.txt;
rm result.txt;





