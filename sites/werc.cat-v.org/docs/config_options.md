Werc Configuration Options
==========================


Titles and metadata
-------------------

Variables:

* Page title:
    * siteTitle
    * siteSubTitle

* Html header meta tags:
    * meta_description - `<meta name="description" ...`
    * meta_keywords - `<meta name="keywords" ...`
    * extraHeaders  - Raw extra html headers, the content of this var will be inserted inside the `<head>` tag..


Sidebar and navigation
----------------------

Variables:

* sideBarNavTitle

Functions:

* `conf_hide_paths [path_patterns ...]` - Hide the given patterns from navigation menu, sitemap and dir listing (do *not* depend on this for securty!).

Http control
------------

Variables:

* extraHttpHeaders - Raw HTTP headers to be added to response.

Functions:

* `conf_perm_redirect [pattern] destination` - If pattern is provided, match it against the requested url, and replace the match with `destination`; ie., *s/pattern/destination/.



