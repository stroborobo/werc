Nhttpd/Nostromo  Web Server Configuration for Werc
==================================================

Contributed by nsz, thanks!

The last two sections are relevant: aliases (to make non-content site material,
like css, available) and virtual hosts (the document root is set to `werc.rc`
so it will handle every request).

    # MAIN [MANDATORY]
    
    servername      main.host.com
    serveradmin     admin[at]mail.com
    serverroot      /var/nostromo
    servermimes     conf/mimes
    logpid          logs/nhttpd.pid
    logaccess       logs/access_log
    docroot         /var/nostromo/htdocs
    docindex        index.html
    
    # SETUID [RECOMMENDED]
    
    user            nhttpd
    
    # BASIC AUTHENTICATION [OPTIONAL]
    #...
    
    # SSL [OPTIONAL]
    #...
    
    # CUSTOM RESPONSES [OPTIONAL]
    #...
    
    # HOMEDIRS [OPTIONAL]
    #...
    
    # ALIASES [OPTIONAL]
    
    /pub            /path/to/werc/pub
    # The following line doesn't work because nhttpd doesn't support file aliases yet.
    #/favicon.ico        /path/to/werc/pub/default_favicon.ico
    
    # VIRTUAL HOSTS [OPTIONAL]
    
    vhost1.com      /path/to/werc/bin/werc.rc
    vhost2.com      /path/to/werc/bin/werc.rc
    #...

To use werc on `main.host.com` as well just set `docroot` to `/path/to/werc/bin/werc.rc`
and set `docindex` to empty string.

There was a bug in nhttpd <=1.9, it did not set `SERVER_NAME` properly (left it `main.host.com`).
To solve this problem just add a

    SERVER_NAME=$HTTP_HOST

line somewhere at the top of `werc.rc`.



