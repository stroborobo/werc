%{
get_post_args target_blog_dir post_title post_body

if(~ $REQUEST_METHOD POST && ! ~ $#target_blog_dir 0 && ! ~ $#post_title 0) {

    get_user

    if(test -f $sitedir/$target_blog_dir/_werc/config)
        . $sitedir/$target_blog_dir/_werc/config

    if(~ $#blog_editors_group 0)
        echo Cant post to $target_blog_dir, no editors group set.
    if not if (! user_in_group $blog_editors_group)
        echo Post to $target_blog_dir denied, user $logged_user not in group $blog_editors_group
    if not if(! make_blog_post $target_blog_dir $post_title $post_body)
        echo Posting to $target_blog_dir failed: $status
    if not
        echo Posted to $target_blog_dir.
}
%}
<form method="POST">
    Submit a new blog post
    Post title: <input type="text" name="post_title" /><br />
    <textarea name="post_body"></textarea><br />
    <input type="text" name="target_blog_dir" value="%($target_blog_dir%)" /><br />
    <input type="submit" value="Post" />
</form>
