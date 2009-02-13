User and Group Management
=========================

User accounts and group membership are stored under `etc/users/` and `etc/groups/` respectively.

A user account consists of a directory under `etc/users/` that contains files with that users account information, the only required file is `password` containing a password for the user. For example:

	% ls etc/users/
	eekee  uriel  yosyp
	% cat etc/users/uriel/password
	mypass

Groups consists of files named after the group name stored in `etc/groups/`, containing the names of the group members, one per line.

The group 'admin' is 'built-in' and any members in that group will have admin privileges for most werc apps by default.

Example
-------

To create a user called [glenda](http://glenda.cat-v.org) that is a member of the group `rabbits` you can do:

	% mkdir etc/users/glenda/
	% echo passw > etc/user/glenda/password
	% echo glenda >> etc/users/rabbits

Utils
-----

The script at bin/aux/addwuser.rc allows you to even more trivially add users. 

	addwuser.rc user_name user_pass [groups ...]
