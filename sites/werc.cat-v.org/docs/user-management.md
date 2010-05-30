User and Group Management
=========================

User account and group membership information are stored under `etc/users/`.

A user account consists of a directory under `etc/users/` that contains files with that users account information, the only required file is `password` containing a password for the user. For example:

	% ls etc/users/
	eekee  uriel  yosyp
	% cat etc/users/uriel/password
	mypass

Users and groups share the same namespace, you can create a group the same way you create a user but instead of a 'password' file adding a 'members' file containing the names of the group members, one per line.

A 'user-group' directory can contain both a password and members file, in which case it will act concurrently as a user and as a group.

The group 'admin' is 'built-in' and any members in that group will have admin privileges for most werc apps by default.

Example
-------

To create a user called [glenda](http://glenda.cat-v.org) that is a member of the group `rabbits` you can do:

	% mkdir etc/users/glenda/
	% echo carrot > etc/users/glenda/password
	% mkdir -p etc/users/rabbits
	% echo glenda >> etc/users/rabbits/members

Utils
-----

The script at bin/aux/addwuser.rc allows you to even more trivially add users. 

	addwuser.rc user_name user_pass [groups ...]


