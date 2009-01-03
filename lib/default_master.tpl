
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

% if(! ~ $#sidebar 0) {
<div id="side-bar">

<div>
%{
if(! ~ $#sideBarNavTitle 0)
    echo '<p class="sideBarTitle">'$"sideBarNavTitle':</p>'

gensidebar

%}
</div>

% if(! ~ $#wiki 0 && test -f $local_path.md  && check_user $wiki_editors_group) {
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

% if(! ~ $#allowComments 0) {

%{
cdir = $local_path.md_werc/comments
if(test -d $cdir) { 
    echo '<hr /><h2>Comments</h2>'
    for(c in `{ls $cdir/}) {
%}
        <div>
%       echo  By: `{cat $c/user}
        <br />
%       cat $c/body | escape_html | sed 's,$,<br />,'
        <hr /></div>
%{
    }
}
%}
<hr /><hr />
<form action="" method="post">
% if(! check_user) {
    User: <input type="text" name="comment_user_name" value="" /> Password:
    <input type="password" name="comment_user_password" value="" />
    <small>If you are not registered enter your desired user/password and your account will be created when your comment is approved.</small>
% }
    <textarea name="comment_text" id="comment_text" cols="80" rows="16"></textarea>
    <input type="submit" name="post_comment" value="Post a comment" />
</form>
% }

</div>

<div id="footer">
% cat `{ get_lib_file footer.inc }
</div>
