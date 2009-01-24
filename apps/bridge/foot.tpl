% cdir = $local_path^'_werc/comments'
% if(test -d $cdir) { 
    <hr /><h2>Comments</h2>
%    for(c in `{ls $cdir/}) {
        <div>By: 
%           cat $c/user
            <br />
%           cat $c/body | escape_html | sed 's,$,<br />,'
        <hr /></div>
%    }
% }

<hr />

<form action="" method="post">
    <textarea name="comment_text" id="comment_text" cols="80" rows="16"></textarea>
    <br />
    <input type="submit" name="post_comment" value="Post a comment" />
% if(! check_user) {
    User: <input type="text" name="comment_user_name" value="" />
    Password: <input type="password" name="comment_user_password" value="" />
    <div style="font-size: 70%">If you are not registered enter your desired user/password and your account will be created when your comment is approved.</div>
% }
</form>

