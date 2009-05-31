Setup werc with NGINX
=====================

You probably will want to to use fcgiwrap, called from spawn-fcgi or similar.

Here is an extremely basic nginx configuration, with this configuration static files will be handled by werc and not nginx, this is clearly dumb, but works:

        worker_processes  1;

        #error_log  logs/error.log;
        #error_log  logs/error.log  notice;
        error_log  logs/error.log  info;

        pid        logs/nginx.pid;

        events {
            worker_connections  1024;
        }


        http {
        include       mime.types;
        default_type  application/octet-stream;

        #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
        #                  '$status $body_bytes_sent "$http_referer" '
        #                  '"$http_user_agent" "$http_x_forwarded_for"';

        #access_log  logs/access.log  main;

        sendfile        on;
        #tcp_nopush     on;

        #keepalive_timeout  0;
        keepalive_timeout  65;

        #gzip  on;

        server {
            listen       80;
            server_name  test.cat-v.org; # Replace with your domain name.

            #charset utf-8;

            #access_log  logs/host.access.log  main;

            location / {

            # FastCGI params, usually stored in fastcgi_params
            # and imported with a command like the following:
            #include        fastcgi_params;

            # Typical contents of fastcgi_params (inlined here):
            fastcgi_pass localhost:9000;

            fastcgi_param  QUERY_STRING       $query_string;
            fastcgi_param  REQUEST_METHOD     $request_method;
            fastcgi_param  CONTENT_TYPE       $content_type;
            fastcgi_param  CONTENT_LENGTH     $content_length;

            #fastcgi_param  SCRIPT_FILENAME   /var/www/werc/bin/werc.rc;
            fastcgi_param  SCRIPT_NAME        /var/www/werc/bin/werc.rc;
            #fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;

            fastcgi_param  REQUEST_URI        $request_uri;
            fastcgi_param  DOCUMENT_URI       $document_uri;
            fastcgi_param  DOCUMENT_ROOT      $document_root;
            fastcgi_param  SERVER_PROTOCOL    $server_protocol;

            fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
            fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;

            fastcgi_param  REMOTE_ADDR        $remote_addr;
            fastcgi_param  REMOTE_PORT        $remote_port;
            fastcgi_param  SERVER_ADDR        $server_addr;
            fastcgi_param  SERVER_PORT        $server_port;
            fastcgi_param  SERVER_NAME        $server_name;
            fastcgi_param  REMOTE_USER        $remote_user;

            #root   /var/www/werc/sites/$server_addr; # XXX This doesn't work, not sure why :(
            root /;
            #index  index.html index.htm;
            }
        }
    }


Then you can use spawn-fcgi or similar to get wrapcgi going:

	spawn-fcgi -a 127.0.0.1 -p 9000 -f /home/uriel/dvl/ext/fcgiwrap/fcgiwrap # Use the path to your fcgiwrap binary here


Other Setups
------------

More elaborate setups with direct handling of static files, caching, and multiple fcgi/cgi handlers should be easy, if you have any please post them to the werc9 mailing list.
