#! /usr/bin/zsh



if [ -z $1 ]; then
echo "Usage: getheaders <host_file>";
else

mkdir header;
CURRENT_PATH=$(pwd);

for i in $(cat $1)
do
NAME=$(echo $i | awk -F/ '{print $3}');
curl -X GET -H "X-Forwarded-For: jhnwck.com" $i -I > "$CURRENT_PATH/header/$NAME";
done
fi