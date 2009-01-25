Content-Type: text/xml; charset=utf-8

<?xml version="1.0" encoding="UTF-8"?>

%{
fn statpost {
	f = $1

	post_uri = `{echo $f | sed 's,^'$sitedir',,'}
	title=`{basename $f | sed 's/^[0-9\-]*_(.*)\.md$/\1/; s/_/ /g' }
	date=`{/bin/date -Rd `{echo $f|sed 's,.*/([0-9][0-9][0-9][0-9]/[0-9][0-9]/[0-9][0-9])/.*,\1,'}}
	# TODO: use mtime(1) and ls(1) instead of lunix's stat(1)
	stat=`{stat -c '%Y %U' $f}
	#mdate=`{/bin/date -Rd $stat(1)} # Not used because it is unreliable
	post_uri=$base_url^`{cleanname `{echo -n $post_uri | sed 's/\.(md|tpl)//g'}}
	by=$stat(2)
	ifs=() {
		summary=`{awk -v max'='1024 '{
			nc += 1 + length;
			if(nc > max) {
				print substr($0, 1, nc - max) "..."
				exit
			}
			print
		}' $f/index.md |fmt -j| sed 's/\]\]>/Fucking goddamn XML garbage/g'}
	}
}

%}

<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
	<channel>
		<atom:link href="%('http://'$site^$req_path%)" rel="self" type="application/rss+xml" />
		<title>%($siteTitle%)</title>
		<link>%($req_path%)</link>
		<description>%($blogDesc%)</description>
		<language>en-us</language>
		<generator>Tom Duff's rc, and Kris Maglione's clever hackery</generator>
%{
		# <webMaster>uriel99+rss@gmail.com (Uriel)</webMaster>
        for(f in `{get_post_list $blagh_root$blagh_dirs}) {
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
