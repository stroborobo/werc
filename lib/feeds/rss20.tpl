Content-Type: text/xml; charset=utf-8

%{
fn statpost {
	f = $1
	uri = `{echo $f | sed 's,^'$sitedir',,'}
	title=`{basename $f | sed 's/^[0-9\-]*_(.*)\.md$/\1/; s/_/ /g' }
	date=`{/bin/date -Rd `{basename $f |sed 's/(^[0-9\-]*).*/\1/; s/-[0-9]$//'}}
	# TODO: use mtime(1) and ls(1) instead of lunix's stat(1)
	stat=`{stat -c '%Y %U' $f}
	#mdate=`{/bin/date -Rd $stat(1)} # Not used because it is unreliable
	uri=$baseuri^`{cleanname `{echo -n $uri | sed 's/\.(md|tpl)//g'}}
	by=$stat(2)
	ifs=() {
		summary=`{awk -v max'='1024 '{
			nc += 1 + length;
			if(nc > max) {
				print substr($0, 1, nc - max) "..."
				exit
			}
			print
		}' $f |fmt -j| sed 's/\]\]>/Fucking goddamn XML garbage/g'}
	}
}

%}

<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<atom:link href="%('http://'$site^$REQUEST_URI%)" rel="self" type="application/rss+xml" />
		<title>%($siteTitle%)</title>
		<link>%($uri%)</link>
		<description>%($blogDesc%)</description>
		<language>en-us</language>
		<generator>Tom Duff's rc, and Kris Maglione's clever hackery</generator>
%{
		# <webMaster>uriel99+rss@gmail.com (Uriel)</webMaster>
		for(f in `{sortedBlogPostList $blogDirs}) {
			statpost $f
			# Hack to aproximate the last build date 
			#(use the mdate from last posted item)
			# Commented out for now because maybe a wrong value is worse than no value
			#if(~ $#last_build_date 0) {
				#last_build_date='<lastBuildDate>'^$"mdate'</lastBuildDate>'
				#echo $last_build_date
			#}
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
