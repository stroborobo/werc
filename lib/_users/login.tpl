%{
get_user
if(! ~ $#logged_user 0)
    echo 'You are logged in as' $logged_user
if not if (~ $REQUEST_METHOD POST)
    echo 'Login failed!'

%}
<form method="POST">
    User name: <input type="text" name="user_name" /><br />
    User password: <input type="password" name="user_password" /><br />
    <input name="s" type="submit" value="Login" />
</form>
