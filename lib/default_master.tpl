
<div id="header">
    <div class="superHeader">
% cat `{ get_lib_file top_bar.inc }
    </div>

    <div class="midHeader">
    <h1 class="headerTitle"><a href="/">%($"siteTitle%)<span id="headerSubTitle">%( $"siteSubTitle%)</span></a></h1>
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

% run_handlers $handlers_body_head

% run_handler $handler_body_main

% run_handlers $handlers_body_foot

</div>

<div id="footer">
% cat `{ get_lib_file footer.inc }
% echo $"logged_user
</div>
