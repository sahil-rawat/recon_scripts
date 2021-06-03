#! /usr/bin/zsh

crtsh () {
	curl -s https://crt.sh/\?q\=\%25.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u 
}

certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
}

if [ -z $1 ]; then
echo "Usage: getdomain <domain_name>"
else

mkdir $1;
cd $1;

echo "Finding Subdomains"
echo "Using subfinder...."
subfinder -d $1 -o subfinder.$1.txt > /dev/null 2>&1 ;
echo "Using sublist3r......."
sublist3r -d $1 -o sublister.$1.txt  > /dev/null 2>&1 ;
echo "Using crtsh..............."
crtsh $1 >>sublister.$1.txt;
echo "Using certspotter..............."
certspotter $1 >>sublister.$1.txt;
echo "Using assetfinder..............."
assetfinder --subs-only $1 >>sublister.$1.txt;
echo "Compiling Results................"
cat subfinder.$1.txt >> sublister.$1.txt;
sort -u subfinder.$1.txt -o domains.txt
rm subfinder.$1.txt sublister.$1.txt;

echo "\nFinding Alive Http Host...."
echo "Using httprobe..............."
cat domains.txt | httprobe > alive.txt;

fi
