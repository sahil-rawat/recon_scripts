# Scripts To Automate Recon Processs

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