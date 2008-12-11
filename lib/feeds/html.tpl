% if (! ~ $blogTitle '')
%    echo '<h1>'$"blogTitle'</h1>'

<div style="text-align:right">(<a href="index.rss">RSS Feed</a>|<a href="index.atom">Atom Feed</a>)</div>

%{
for (f in `{ sortedBlogPostList $blogDirs }) {
    gen_blog_post_title $f
    cat $f 
    echo ' ' # XXX I have no clue why the ' ' is needed, a echo without args breaks markdown.pl?!?
} | $formatter

# TODO Should check if user has perms and so on
get_user
if(~ $#logged_user 1) {
%}
<form method="POST" action="/_apps/brag/post_form">
    <input type="hidden" name="target_blog_dir" value="%($blogDirs(1)%)" />
    <input type="submit" name="Submit" value="New blog post" /> 
</form>
% }
<hr />
