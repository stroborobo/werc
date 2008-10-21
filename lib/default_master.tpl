
<div id="header">
    <div class="superHeader">
% cat `{ get_lib_file top_bar.inc }
    </div>

    <div class="midHeader">
% gentitle
    </div>
    
    <div class="subHeader">
        <br />
    </div>
</div>

% if (! ~ $#sidebar 0) {
<div id="side-bar">

<div>
%{
if (! ~ $#sideBarNavTitle 0)
    echo '<p class="sideBarTitle">'$"sideBarNavTitle':</p>'

gensidebar

%}
</div>

% # TODO: probably should check if we have the right perms
% if (! ~ $#wiki 0 && test -f $body.md  && get_user && ! ~ $#logged_user 0) {
<div> 
    <form action="/_apps/dirdir/edit" method="POST">
        <input type="hidden" name="edit_wiki_page" value="%($req_path%)" />
        <input type="submit" name="" value="Edit page" />
    </form>
</div>
% }

<div>
</div>

</div>
% }

<div id="main-copy">

% genbody

% if (! ~ $#allowComments 0) {

%{
cdir = $body.md_werc/comments
if (test -d $cdir) { 
    echo '<hr /><h2>Comments</h2>'
    for(c in `{ls $cdir}) {
        parse_rec $c
    
        echo '<div>'
        echo User: $rec_user_name '<br />'
        echo $rec_data | escape_html | sed 's,$,<br />,'
        echo '<hr /></div>' 
    }
}
%}

<form action="" method="post">
    <input type="text" name="comment_user_name" value="Anonimous glenda" /><input type="submit" name="post_comment" value="Post a comment" />
    <textarea name="comment_text" id="comment_text" cols="80" rows="16"></textarea>
</form>
% }

</div>

<div id="footer">
% cat `{ get_lib_file footer.inc }
</div>
