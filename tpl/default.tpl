
<div id="header">
    <div class="superHeader">
        <div class="left">
          <a href="http://harmful.cat-v.org">harmful</a> |
          <a href="http://cat-v.org">cat-v.org</a> |
          <a href="http://cat-v.org/who/uriel/">uriel</a> |
          <a href="http://cat-v.org/9p/">9P</a>
        </div>

        <div class="right">
          <span class="doNotDisplay">Related sites:</span>
          <a href="http://9fans.net">Plan 9 from Bell Labs</a> |
          <a href="http://plan9.us">Plan 9 from User Space</a> |
          <a href="http://code.google.com/p/inferno-os/">Inferno</a>
        </div>
    </div>

    <div class="midHeader">
%echo         '<h1 class="headerTitle"><a href="/">'$"siteTitle' <span id="headerSubTitle">'$"siteSubTitle'</span></a></h1>'
    </div>
    
    <div class="subHeader">
        <br />
    </div>
</div>

%if (! ~ $#sidebar 0) {
<div id="side-bar">
<div>
    <p class="sideBarTitle">Considered harmful:</p>
%  gensidebar
</div>

    <div class="spam" style="padding: 1em 0;">
        <script type="text/javascript"><!--
        google_ad_client = "pub-2060328396151526";
        google_alternate_color = "3D81EE";
        google_ad_width = 125;
        google_ad_height = 125;
        google_ad_format = "125x125_as";
        google_ad_type = "text";
        google_ad_channel = "";
        google_color_border = "FFFFFF";
        google_color_bg = "FFFFFF";
        google_color_link = "0000FF";
        google_color_text = "000000";
        google_color_url = "008000";
        //-->
        </script>
        <script type="text/javascript"
          src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
    </div>
</div>
% }

<div id="main-copy">

    <div class="spam">
        <script type="text/javascript"><!--
        google_ad_client = "pub-2060328396151526";
        google_ad_width = 728;
        google_ad_height = 15;
        google_ad_format = "728x15_0ads_al";
        google_ad_channel = "";
        google_color_border = "FFFFFF";
        google_color_bg = "FFFFFF";
        google_color_link = "0000FF";
        google_color_text = "000000";
        google_color_url = "008000";
        //--></script>
        <script type="text/javascript"
          src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
    </div>


% if ( test -f $body ) { cat $body | markdown.pl } 
% if not { template.awk tpl/_inc/404.tpl | rc }

    <hr />

    <div class="spam">
        <script type="text/javascript"><!--
        google_ad_client = "pub-2060328396151526";
        google_alternate_color = "FFFFFF";
        google_ad_width = 728;
        google_ad_height = 90;
        google_ad_format = "728x90_as";
        google_ad_type = "text";
        //2007-05-26: harmful-bottom-banner
        google_ad_channel = "2301440557";
        google_color_border = "FFFFFF";
        google_color_bg = "FFFFFF";
        google_color_link = "0000FF";
        google_color_text = "000000";
        google_color_url = "008000";
        //-->
        </script>
        <script type="text/javascript"
          src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
    </div>

</div>

<div id="footer">
<!--
<br class="doNotDisplay doNotPrint" />
<div class="right">
Hosted at: <a href="http://cat-v.org">cat-v.org</a>
</div>
-->
</div>

</body>
</html>

