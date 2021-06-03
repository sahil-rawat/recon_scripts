
take(){
	if [ -d $1 ]; then
		echo "\n"
	else
		mkdir $1 
	fi
}

if [ -z $1 ]; then
echo "Usage: getheaders <host_file>";
else


for i in $(cat $1)
do 
amass enum -ip -active -noalts -d $i -dir $i;
done

fi
