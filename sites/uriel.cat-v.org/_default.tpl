
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
% cat sites/$masterSite/_inc/footer.inc
</div>

<!-- Google Analytics -->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-1220719-8");
pageTracker._initData();
pageTracker._trackPageview();
</script>
