Setting Up Your HTTP Server to Run Werc
=======================================


Werc should work with any web server that supports the CGI interface, and a few
that don't. Here are collected instructions and sample configurations for some
of the most popular HTTP servers that people has used with werc.

In general setup consists of mapping all paths for a virtual host to the
werc.rc script, usually in practice this means that the `document root` (or
similar concept) for a virtual host is mapped to
`/path/to/werc/sites/domain.name.com/`, and if no static file matches the
request, control is handed to werc.rc, this allows the HTTP server to handle
static files and werc to handle everything else (note that such a setup will
expose your `_werc/config` files, which usually should not be a security
issue).
