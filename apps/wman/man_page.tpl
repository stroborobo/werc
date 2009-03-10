<pre>
%{

# Hack to handle 0intro files.
f=$wman_page^$"wman_pe
if(~ $wman_page intro && test -f $wman_cat_path^/0^$f)
    f=0^$f

wman_page_gen $wman_cat_path^/^$f

%}
</pre>
