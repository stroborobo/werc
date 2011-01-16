Setup werc with Apache
======================

Note: Apache 2.x configuration should be similar to 1.3.x, but Apache 2.x is not recommended due to unwindy complexity, please use a saner web server.

Apache 1.3.x: minimalist configuration
======================================

No virtual hosts and let werc handle static files.

    RewriteEngine On
    ServerName test.cat-v.org
    AddHandler cgi-script .rc

    <Directory /var/www/werc/bin>
        Options ExecCGI
    </Directory>
    <IfModule mod_dir.c>
        DirectoryIndex /werc.rc
    </IfModule>

    RewriteRule /werc.rc /var/www/werc/bin/werc.rc
    DocumentRoot /var/www/werc/bin/
    ErrorDocument 404 /werc.rc


Apache 1.3.x: standard configuration
====================================

This lets apache handle static files.

    <VirtualHost *>

        RewriteEngine On
        ServerName test.cat-v.org
        AddHandler cgi-script .rc

        <Directory /var/www/werc/bin>
            Options ExecCGI
        </Directory>
        <IfModule mod_dir.c>
            DirectoryIndex /werc.rc
        </IfModule>

        RewriteRule (.*) /var/www/werc/sites/%{HTTP_HOST}/$1

        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule .* /var/www/werc/bin/werc.rc

        RewriteRule /werc.rc /var/www/werc/bin/werc.rc
        DocumentRoot /var/www/werc/bin/
        ErrorDocument 404 /werc.rc

    </VirtualHost>


Apache 1.3.x: advanced configuration
====================================


    <VirtualHost *>

        RewriteEngine On
        ServerName cat-v.org
        ServerAlias www.cat-v.org harmful.cat-v.org 9p.cat-v.org gsoc.cat-v.org doc.cat-v.org uriel.cat-v.org www.binarydream.org ninetimes.cat-v.org *.cat-v.org
        AddHandler cgi-script .rc
        AddHandler cgi-script .cgi
        <Directory /home/uriel/cat-v.org/bin>
            Options ExecCGI
        </Directory>
        <IfModule mod_dir.c>
            DirectoryIndex /werc.rc
        </IfModule>

        RewriteRule ^/hg/(.*)    /home/uriel/cat-v.org/bin/hgwebdir.cgi/$1 [L]

        RewriteRule /pub/style/style.css /home/uriel/cat-v.org/pub/style/style.css [L]
        RewriteRule /pub/ /home/uriel/cat-v.org/pub/ [L]
        RewriteRule /favicon.ico /home/uriel/cat-v.org/pub/default_favicon.ico [L]


        RewriteRule (.*) /home/uriel/cat-v.org/sites/%{HTTP_HOST}/$1

        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule .* /home/uriel/cat-v.org/bin/werc.rc

        RewriteRule /werc.rc /home/uriel/cat-v.org/bin/werc.rc
        DocumentRoot /home/uriel/cat-v.org/bin/
        ErrorDocument 404 /werc.rc

    </VirtualHost>


