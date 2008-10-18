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
<form method="POST" action="/_apps/blog/post_form">
% echo '<input type="text" name="target_blog_dir" value="'^$blogDirs(1)^'" />'
    <input type="submit" name="Submit" value="New post" /> 
</form>
% }
<hr />
