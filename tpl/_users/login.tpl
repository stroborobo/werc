<h1>User login</h1>
<br />
% if(check_user) {
    You are logged in as: <b>%($logged_user%)</b>
% }
% if not {
%    if (~ $REQUEST_METHOD POST)
%        echo '<div class="notify_errors">Login failed!</div>'
<form method="POST" action="" style="text-align: right; float: left;">
<fieldset>
    <label>User name: <input type="text" name="user_name" value="%($"post_arg_user_name%)"/></label><br>
    <label>User password: <input type="password" name="user_password"></label><br>
    <input name="s" type="submit" value="Login">
</fieldset>
</form>
% }

<br style="clear:left">
