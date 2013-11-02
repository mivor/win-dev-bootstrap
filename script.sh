#!/bin/bash

curl_silent() {
    echo "$1"
    curl -s "$@"
}

# download git download-page

curl_silent http://git-scm.com/download/win -o git-download.html

# get the downloa link from the page
git_exe_link=$(sed -n -e 's/.*"\(.*\)".*download manually.*/\1/p' git-download.html)
git_exe_link=$(echo $git_exe_link | sed -e 's/https/http/')
# get the portable link
git_7z_link=$(echo "$git_exe_link" | sed -e 's/Git/PortableGit/' -e 's/exe/7z/')

echo $git_exe_link
echo $git_7z_link
#download git-exe
curl_silent $git_exe_link -o git-exe.exe
curl_silent $git_7z_link -o git-7z.exe

rm git-download.html
rm git-exe.exe
rm git-7z.exe
