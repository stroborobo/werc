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
%}		<item>
			<title>%($title%)</title>
			<author>%($by%)@noreply.cat-v.org (%($by%))</author>
			<link>%($uri%)</link>
                        <guid isPermaLink="true">%($uri%)</guid>
			<pubDate>%($date%)</pubDate>
			<lastBuildDate>%($mdate%)</lastBuildDate>
			<description><![CDATA[<pre>%($summary%)</pre>]]></description>
		</item>
%		}
	</channel>
</rss>
