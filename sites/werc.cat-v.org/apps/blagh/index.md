Blagh - A Blogging engine for people who hate blogs
===================================================

Balgh is werc a werc app that implements a blogging engine.

Some features include:

* File based, database free.
* History browsing.
* Atom and RSS feeds.
* Server-side feed 'aggregation' (merge multiple blogs into a single one).
* Comments using [bridge](../bridge/)
* Markdown formatting.

Possible alternative names: Blag, Blah, Bragg.

Posting
-------

New pots can be created in at least two different ways: using the web interface (if you have logged in and your user or groups are in `$conf_blog_editors`) or from the command line using the script at bin/aux/bpst.rc, as you can see from the source of that very simple script, it is trivial to create new posts by simply using mkdir and echo.

Configuration options
---------------------

This are options you can set in your _werc/config 

### `conf_enable_blog` *[blog dirs]*

Setup a blog in this dir. By default the blog contents will only include posts stored in this dir, if you pass any arguments the posts in the various dirs will be aggregated in this feed.

Examples:

    # This will setup a blog in this dir that includes only posts in this dir.
    conf_enable_blog 

    # This will create a blog that aggregates all the posts in all blog dirs in any users/ sub dir.
    conf_enable_blog users/*/blog 

### `conf_blog_editors`=(*groups or users that will be allowed to make new blog posts*)

This is optional and by default set to the 'blog-editors' group.

See also:

* To edit blog posts you can use the functionality provided by [the dirdir app](../dirdir/).
* Commenting can be handled by [the bridge app](../bridge/).


