Setup werc with lighttpd
========================

You will need to enable to the following modules: `mod_cgi`, `mod_alias` and `mod_rewrite` (for non-minimal configurations).

You can also find `mod_setenv` useful to change werc's environment ($PATH in perticular)

Minimal setup
-------------
This is the most minimal setup, for a single domain, and lets werc handle static files.

    $HTTP["host"] =~ "^test\.cat-v\.org$" {
        index-file.names = ( )
        server.error-handler-404 = "/werc.rc"
        alias.url       += ( "/werc.rc" => "/var/www/cat-v.org/bin/werc.rc" ) # Here use the path to werc.rc in your system.
        cgi.assign += ( ".rc" => "")
        server.dir-listing = "disable"
    }

Advanced setup
--------------

A more ellaborate setup, using virtual hosts to handle multiple domains, and
alias to let lighttpd handle static files.  Also show how to add external cgi's
to the setup, in this case Mercurial's web interface.

    $HTTP["host"] =~ "^((harmful|9p|gsoc|doc|uriel|src|repo|www|)(\.|)cat-v\.org|(www\.)?binarydream.org|)$" {

        index-file.names = ( )
        evhost.path-pattern     = "/var/www/cat-v.org/sites/%3.%0/"
        server.error-handler-404 = "/werc.rc"

        alias.url       += ( "/pub/" => "/var/www/cat-v.org/pub/" )
        alias.url       += ( "/favicon.ico" => "/var/www/cat-v.org/pub/default_favicon.ico" )
        alias.url       += ( "/doc/" => "/var/www/cat-v.org/sites/doc.cat-v.org/" )
        alias.url       += ( "/werc.rc" => "/var/www/cat-v.org/bin/werc.rc" )
        alias.url       += ( "/debug.rc" => "/var/www/cat-v.org/bin/debug.rc" )
        cgi.assign += ( ".rc" => "")
        server.dir-listing = "disable"

        cgi.assign += ( ".cgi" => "")
        url.rewrite-once = ( "/hg/(.*)" => "/hg/hgwebdir.cgi/$1" )
        alias.url       += ( "/hg/" => "/var/www/cat-v.org/bin/"  )
    }
