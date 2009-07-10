wman - A Web Interface to Man Pages
===================================

Wman is an app that allows you to export Unix and Plan 9-style man pages. It
can do this directly, without need to generate static html versions and will
automatically pick updates and new man pages.

It is also fairly smart in generating links for man page references.

Configuration
-------------

To display a collection of man pages in a desired path you can use the following config directive:

    conf_enable_wman /usr/share/man

This will allow you to browse the man pages under /usr/share/man.

For man pages organized in the traditional unix structure `manN/foo.N` where N is the section number, set in your config file:

    wman_unix_mode=1

Demo
----

For a demo of this app see [man.cat-v.org](http://man.cat-v.org).

TODO
----

* We don't handle compressed man pages, but this should be trivial to add.
* Unix systems might use different macros for their man pages.
* Search (using keywords? Google? grep?)
* Inferno contains man pages named like 'foo-0intro', which are refered as foo-intro(X), should automatically add (or remove) the extra '0' (Examples: sys-intro(2) and draw-intro(2)).
