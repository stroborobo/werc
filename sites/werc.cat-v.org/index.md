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


Latest Source
-------------

To get a copy of the latest development code using mercurial, do:

	hg clone http://gsoc.cat-v.org/hg/werc/

You can also [browse the online repository](http://gsoc.cat-v.org/hg/werc/).


Contact
-------

For questions, suggestions, bugrepports and contributing patches you can join the [werc9 mailinglist](http://groups.google.com/group/werc9).

On irc, join #plan9 on irc.freenode.org


Links
-----

* [werc project at freshmeat](http://freshmeat.net/projects/werc/) - You can get new release notifications there.
* [werc project at ohloh](https://www.ohloh.net/p/werc/)

License
-------

Public domain (by default includes markdown.pl which has a different license, but this can be replaced).

Credits
-------

Thanks to Kris Maglione (aka JG) for implementing rss feeds, for writing the
awk rc-templating system, and other help and inspiration (some parts of the
code were based on JG's diri wiki).

Thanks to Mechiel (aka oksel) for the md_cache script.

Thanks Garbeam (aka arg) for writing the original diri code and showing that
writing complex web apps in rc was feasible.

And thanks to everyone else whom I have forgotten and that has provided fixes
and feedback.
