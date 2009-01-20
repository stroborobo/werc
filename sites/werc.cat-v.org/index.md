werc - A sane web framework
=============================

Werc is a minimalist web framework built on the Unix and Plan 9 *tool philosophy* of software design.

Werc avoids the pain of managing collections of websites and developing web applications.

* Database free, uses files and directories instead.
* Written using the rc shell, leveraging the standard Unix/Plan 9 command toolkit.
* Minimize tedious work: eg., no need to ever write HTML, use markdown (or any other format) instead.
* Very minimalist yet extensible codebase: highly functional core is 150 lines, with extra functionality in modular apps.


Features
--------

Here are some of the features provided by werc:

* Good integration with pre-existing content, you can add HTML or plain text files and they will be seamlessly integrated with the site.
* You can use your favorite tools (text editor, file manager, etc) to edit and manage data stored in werc.
* Designed to manage any number of 'virtual' domains that share a common style, layout, etc from a single werc installation.
* Configuration and customization can be at at any level: global, per-domain-group, domain-wide, directory sub-tree, and single file.
* Can trivially run multiple (customized) versions of werc side by side.
* Very simple and flexible user management and permissions system.
* Applications can be easily combined: eg., add comments to your blog or wiki by enabling the 'bridge' app; or by enabling the 'diridir' wiki convert any document tree into a wiki.
* Can easily write werc 'apps' and extensions in *any* language! (But of course, rc is recommended).

Install Requirements
--------------------

All you need is some Plan 9 commands (cat, grep, sed, rc, etc.), and an HTTP
server with CGI support.

Werc runs on any Unix-like system where [Plan 9 from User Space](http://plan9.us)
is available (this includes Linux, *BSD, OS X and Solaris), and on Plan 9.

Werc can use any HTTP server that can handle CGI, and has been tested with at
least Apache, Lighttpd, Cherokee, nhttpd, Hiawatha, and others.

Werc uses markdown by default (and the standard Perl markdown is included with the distribution), to format documents, but any other formatting
system can be used.
