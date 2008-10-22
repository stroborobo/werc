% if (! ~ $blogTitle '')
%    echo '<h1>'$"blogTitle'</h1>'

<div style="text-align:right">(<a href="index.rss">rss feed</a>)</div>

%{
for (f in `{ sortedBlogPostList $blogDirs }) {
    gen_blog_post_title $f
    cat $f 
    echo 
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
