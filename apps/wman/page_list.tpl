% d=`{wman_get_section_desc $wman_cat} 
<h1>Manual pages - Section %($wman_cat%): %($"d%)</h1>

<ul style="float:left">
%{
ls -F $wman_cat_path \
    | sed $dirfilter^' /(\/INDEX|\.html)$/d; s/\.([0-9]|9p)$//; s!/0intro$!/intro!' \
    | awk -F/ '{ print "<li><a href=\""$(NF)"\">"$(NF)"</a></li>" }
    NR%28 == 0 { print "</ul><ul style=\"float: left\">" }'
%}
</ul>

