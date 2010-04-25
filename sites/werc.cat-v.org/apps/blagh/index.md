Blagh - A Blogging engine for people who hate blogs
===================================================

Blagh is a werc app that implements a blogging engine.

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

New pots can be created in at least two different ways: using the web interface (if you have logged in and your user or groups are in `$conf_blog_editors`) or from the command line using the script at `bin/aux/bpst.rc`.  This script will, optionally, take a file as an argument using the `-f` switch.  It will open that file in your `$EDITOR` or create a new temporary file if the `-f` switch is omitted.  When you have finished editing the file, the script will call `ispell` (so you may want to install that as well) to check for spelling errors.  Once that has completed a new directory structure will be created in your blog's root directory as a hidden folder named after the current year (as detected by `date`).  You can inspect this directory structure for continuity and `mv` it to unhide it when you are satisfied.  You are encouraged to read the source of that very simple script, and you shall see that it is trivial to create new posts by simply using `mkdir` and `echo`.

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

### `conf_max_lines_per_post=`*[integer]*

This option may be added using the patch linked bellow.  It defaults to `7` which **should** only include the page heading and the first two paragraphs of each post on the main blogroll(?) page.  This makes many assumptions that should be noted.  It just removes everything from `conf_max_lines_per_post` to the end of the file.  Traditionally, line 1 is the H1 title and line 2 is the line of = required to tell mardown of it's importance.  This then assumes that each paragraph is on a single line, which is not enforced by markdown.  See it in action at <http://blog.senet.us>

[blagh-91a4597480a7-conf\_max\_lines\_per\_post.diff](http://senet.us/blagh-91a4597480a7-conf_max_lines_per_post.diff) (1.2K) (20100114)

**Author**: J Thigpen (cdarwin) <darwin@senet.us>

See also:

* To edit blog posts you can use the functionality provided by [the dirdir app](../dirdir/).
* Commenting can be handled by [the bridge app](../bridge/).





