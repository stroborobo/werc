
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
% if (! ~ $#sideBarNavTitle 0) {
%     echo '<p class="sideBarTitle">'$"sideBarNavTitle':</p>'
% }
% gensidebar
</div>

<div>
</div>

</div>
% }

<div id="main-copy">

% genbody

</div>

<div id="footer">
% cat `{ get_lib_file footer.inc }
</div>
