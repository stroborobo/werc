<h1>User login</h1>
<br />
% if(check_user) {
    You are logged in as: <b>%($logged_user%)</b>
% }
% if not {
%    if (~ $REQUEST_METHOD POST)
%        echo 'Login failed!'
<form method="POST">
    User name: <input type="text" name="user_name" /><br />
    User password: <input type="password" name="user_password" /><br />
    <input name="s" type="submit" value="Login" />
</form>
% }
