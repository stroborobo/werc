Site Customization
==================

To change any of the default templates or include files found in /lib/ simply copy them from /lib/ to your site's _werc/lib/ and edit at will.

To change any of the templates found in /tpl/ (e.g. sitemap.tpl), copy the file to your site's root (e.g. /sites/foo.bar.com/sitemap.tpl) and then edit.

File Types
----------

* '.tpl' files are rc [template files](rc_template_lang).
* '.inc' are text files that are inserted 'as is' without any extra processing.

Site Groups
-----------

Site configuration and customization and be 'grouped' to allow a shared set of templates among a specific group of sites (useful for sets of sub-domains for example).

Simply set 'masterSite' configuration variable to the name of the site you want to 'inherit' templates, style and configuration from.

For example, if we have two sites bar.com and foo.bar.com, and in sites/foo.bar.com/_werc/conf we add:

    masterSite=bar.com

When a template (eg., 404.tpl) is requested it will be looked up first in /sites/foo.bar.com/_werc/lib/404.tpl, if that fails then in /sites/bar.com/_werc/lib/, and if that is missing too, the default /lib/404.tpl is used.

The same applies to .inc files.


List of Template and Included Files
-----------------------------------

Here is a list of the most commonly used templates and include files with their corresponding descriptions.

Include:

* top_bar.inc: The thin header at the top of every page, usually contains static links to other related sites or anything else you like.
* footer.inc: Similar but at the bottom of every page, by default  includes a link to the user login page.
* headers.inc: Raw html headers to be included inside <head> tag.

Templates:

* default_master.tpl: This is the main template, which calls all the sidebar and other handlers and applications, usually you won't need to edit it unless you want to make changes to the layout or similar dramatic changes.
* sitemap.tpl: Template for the sitemap page.
* 404.tpl: Template for 'File Not Found' pages.


See also
--------

* [CSS style sheets customization](css_style).


