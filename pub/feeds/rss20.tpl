Content-Type: text/xml; charset=utf-8

<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<atom:link href="%('http://'$site^$REQUEST_URI%)" rel="self" type="application/rss+xml" />
		<title>%($siteTitle%)</title>
		<link>%($uri%)</link>
		<description>%($blogDesc%)</description>
		<language>en-us</language>
		<generator>Tom Duff's rc, and Kris Maglione's clever hackery</generator>
		<webMaster>uriel99+rss@gmail.com (Uriel)</webMaster>
%{
		for(f in `{sortedBlogPostList $blogDirs}) {
			statpost $f
			# Hack to aproximate the last build date (use the mdate from last posted item)
			if(~ $#last_build_date 0) {
				last_build_date='<lastBuildDate>'^$"mdate'</lastBuildDate>'
				echo $last_build_date
			}
%}
		<item>
			<title>%($title%)</title>
			<author>%($by%)@noreply.cat-v.org (%($by%))</author>
			<link>%($uri%)</link>
                        <guid isPermaLink="true">%($uri%)</guid>
			<pubDate>%($date%)</pubDate>
			<description><![CDATA[<pre>%($summary%)</pre>]]></description>
		</item>
%		}

	</channel>
</rss>
