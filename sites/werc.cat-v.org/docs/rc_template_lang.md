Rc template language
====================

Implemented by Kris, thanks!

Basic syntax:

* Lines starting with % are executed as rc commands, the resulting output is inserted in the document.
* use %{ and %} to delimit multi line sections of rc code (note the lack of space between % and { or }!
* To 'inline' the value of an environment variable use `%($my_var%)`

That is basically it!
