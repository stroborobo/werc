Setup werc with Plan 9's httpd
==============================


There are two main options, you can use Russ Cox's magic to cgi translator
(found in his contrib dir as cgi.c), or you can use the following script which
while simpler, it also lacks some features at the moment.

Thanks to soul9 for the original idea of wrapping werc in a shell script that
would setup a cgi-like environment!


    #!/bin/rc

    SERVER_NAME=$2
    REQUEST_URI=`{echo $*(15)}
    REQUEST_URI=$REQUEST_URI(2)
    REQUEST_URI=/
    REQUEST_METHOD=$*(16)
    PLAN9=/


    echo 'HTTP/1.0 200 Ok
    Connection: close
    Server: werc/9.9.9' # This is whatever you like


    cd /usr/web/bin/
    rfork
    /bin/rc < ./werc.rc >[2]/usr/glenda/tmp/w/log # Use whatever location you like to log stderr, but make sure it is writable by none.

Call this script werc-wrap, and put it in /rc/bin/ip/httpd/

Then in your /sys/lib/httpd.rewrite  add a line like:

    /w @/magic/werc-wrap

And this will run werc for all stuff under /w. Note that apparently httpd is
incapable of internally remapping the root directory, so until a solution is
found for this, you will have to keep your site in a sub-directory of the web
server root.

In your /lib/namespace.httpd you probably will want to add something along the
following lines to bind the werc directory into the httpd's namespace:

    bind -b /usr/glenda/src/werc/ /usr/web/
    bind /usr/glenda/src/werc/bin/ /usr/web/magic/


**Notes**: This is experimental and work in progress, there are a couple of issues
with the werc code itself that might need fixing, in particular you will need
to replace the '%($"extraHeaders%)' in lib/headers.tpl with '% echo
$"extraHeaders' no clue why.
