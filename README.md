# Scripts To Automate Recon Processs

Install the tools mentioned below in order to run the scripts.

## Required Tools 

1. subfinder
2. sublist3r
3. assetfinder
4. nmap
5. httprobe
5. curl


## getdomain.sh
 
This scripts uses prebuilt subdomain enumeration tools to run simultaneously and generate the list of unique subdomains found and also the running web server on those domains. The script uses tools:
1. subfinder
2. sublist3r
3. crtsh 
4. assetfinder

And also the tool 

1. httprobe

To find live servers from the list of found subdomians

The script compiles the result in two output files **domains.txt** containing all subdomains found and **alive.txt** containing the list of alive http servers on those domains. 

Install the tools mentioned above in order to run the scripts.

## getheaders.sh
 
This scripts uses the alive hosts identified via the get_domain script to get the header from the web server for furthur enumeration.

The script sends the GET request to each of the host in the **alive.txt** file using curl and storing the result in folder **headers** with each header stored in diffrent file nwith name of the host.

## getports.sh
 
This scripts uses the subdomains identified via the get_domain script to scan for any open port on those hosts and scan for services runnning on those ports.

The script scans each host using nmap and store the output in nmapscan folder with each result stored in diffrent file with the name of domain.
