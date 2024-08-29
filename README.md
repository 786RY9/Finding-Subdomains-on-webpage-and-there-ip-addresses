
Finding all subdomains Listed on the main website webpage and finding there corresponding Ip Addresses

Start by downloading the index page using wget:

$ wget www.website.com

It will be downloaded in index.html file

$ ls

$ less index.html


Manually scanning the file will be time consuming and tough and we may leave some of the subdomains

$ grep “href=” index.html

stirping out lines that contains “.website.com”  indicating that they are subdomains and -v to strip out the boring www.website.com domain that we already know

$ grep “href=” index.html | grep “\.website”  | grep -v “www\.website\.com”  | head
