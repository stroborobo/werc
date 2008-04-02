
<div id="header">
    <div class="superHeader">
% cat sites/$masterSite/_inc/top_bar.inc
    </div>

    <div class="midHeader">
% gentitle
    </div>
    
    <div class="subHeader">
        <br />
    </div>
</div>

%if (! ~ $#sidebar 0) {
<!-- <div style="xbackground: #ffffff url(/pub/style/imgs/sgl.png) no-repeat top left fixed!important;" id="side-bar"> -->
<div id="side-bar">
<div>
    <p class="sideBarTitle">Menu:</p>
%  gensidebar
</div>
</div>
% }

<div style="" id="main-copy">

% genbody

</div>

<div id="footer">
<br class="doNotDisplay doNotPrint" />
</div>

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1220719-8";
urchinTracker();
</script>

</body>
</html>

