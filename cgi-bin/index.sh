#!/bin/sh -e
#QUERY_STRING="voice=zunda_sasayaki"
queryparam="voice"

value=$(echo "${REQUEST_URI/[^?&]*${queryparam}=/}" \
        | sed 's>[&?].*>>' \
        | tr -cd '[:alnum:]\-_' )

#../resourceの中身を\0で区切り、tmpファイルに入れ込む
tmpfile=$(mktemp)
find "../resource/${value}" -type f -print0 > $tmpfile

#音声を一個選ぶ
file=$(shuf -zn1 -- ${tmpfile})
file=${file/../.}

rm ${tmpfile}


echo "Content-Type: text/plain"
echo

echo "${file}"
