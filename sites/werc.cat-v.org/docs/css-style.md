Custom CSS Stylesheets
=====================

If you create a file under your site's dir at _werc/pub/style.css it will be included automatically after the standard werc stylesheet.

You can copy pub/style/style.css and customize it, or you can take a simpler file and just change the main color theme.

Here is an example of how to set the main werc colors:


	body { background-color: #FFFFF7; }
	.midHeader { background-color: #FFFFE9; }
	#side-bar { background-color: #EFFFEF; }
	#side-bar a { color: black; }
	#side-bar a:hover {
	  color: white!important;
	  background-color: #428a42;
	}
