Hiawatha Web Server Configuration
---------------------------------

Contributed by sqweek, thanks!

This are the relevant bits:

    CGIhandler = /usr/local/plan9/bin/rc:rc
    ExecuteCGI = yes
    RewriteURL = werc
    UrlRewrite {
        RewriteID = werc
        Match ^(/code|/index|/contact|/clique).* Rewrite /werc.rc
        Match ^/$ Rewrite /werc.rc
    }

