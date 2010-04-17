<hr>

% notices_handler
<form action="" method="post">
    <textarea name="comment_text" id="comment_text" cols="80" rows="16">%($"saved_comment_text%)</textarea>
    <br>
    <input type="submit" name="bridge_post" value="Post a comment">

% if(~ $#logged_user 0) {
%   if(~ $#allow_new_user_comments 1) {
    <label>New user name:
        <input type="text" name="comment_user" value="%($"post_arg_comment_user%)">
    </label>

    <label>Password:
        <input type="password" name="comment_passwd" value="">
    </label>

    <label>Repeat password:
        <input type="password" name="comment_passwd2" value="">
    </label>
    <div style="font-size: 70%">
    Enter your desired user name/password and after your comment has been reviewed by an admin it will be posted and your account will be enabled. If you are already registered please <a href="/_users/login">login</a> before posting.
    </div>
%   }
%   if not if(~ $#bridge_anon_comments 1) {
    <label>Is <a href="http://glenda.cat-v.org">Glenda a cute bunny</a>?
        <select name='ima_robot'>
        <option value="yes">No</option>
        <option value="not">Yes</option>
        <option value="foobar">I hate bunnies!</option>
        <option value="robot">I'm a robot!</option>
        </select>
    </label>
%   }
% }
</form>
