#! /usr/bin/zsh

if [ -z $1 ]; then
echo "Usage: getports <domain_file>";
else

mkdir nmapscan;
CURRENT_DIR=$(pwd)

for i in $(cat $1)
do

nmap -sC -sV $i | tee $CURRENT_DIR/nmapscan/$i;

if [ $(cat $CURRENT_DIR/nmapscan/$i | wc -l) -lt 4 ];then
rm $CURRENT_DIR/nmapscan/$i ;
fi

done
fi 
