wman - A Web Interface to Man Pages
===================================

Wman is an app that allows you to export Unix and Plan 9-style man pages. It
can do this directly, without need to generate static html versions and will
automatically pick updates and new man pages.

It is also fairly smart in generating links for man page references.

Configuration
-------------

To display a collection of man pages in a desired path you can use the following config directive:

    conf_wman_enable /usr/share/man

This will allow you to browse the man pages under /usr/share/man.

Demo
----

For a demo of this app see [man.cat-v.org](http://man.cat-v.org).

TODO
----

* We don't handle compressed man pages, but this should be trivial to add.
* Unix systems might use different macros for their man pages.
* Search (using keywords? Google? grep?)
