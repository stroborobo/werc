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

* `conf_hide_paths [path_patterns ...]` - Hide the given patterns from navigation menu, sitemap and dir listing (do *not* depend on this for security!).

Http control
------------

Variables:

* extraHttpHeaders - Raw HTTP headers to be added to response.

Functions:

* `conf_perm_redirect [pattern] destination` - If pattern is provided, match it against the requested url, and replace the match with `destination`; ie., *s/pattern/destination/.


Access Control and Permissions
------------------------------

The permissions system is very flexible, for example to only allow access to members of the group 'editors' you can do something like:

    if(! check_user editors)
        perm_redirect /_users/login

To automatically redirect users without permission to the login page if they are not members of the group 'editors'.

See also [the documentation on user and group management](user_management).
