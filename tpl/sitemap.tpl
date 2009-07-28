<h1>Site map</h1>

%{
tmpfile=/tmp/werc_sitemap_$pid.txt
tmpfilex=/tmp/werc_sitemapx_$pid.txt
saveddf=$dirfilter

fn listDir {
    d=$1
    dirfilter=$saveddf
    if(test -f $d/_werc/config)
        . ./$d/_werc/config

    if(~ $#perm_redir_to 0) {
        echo '<ul class="sitemap-list">'

        for(i in `{ls -dF $d^*/ $d^*.md $d^*.html $d^*.txt >[2]/dev/null | sed $dirfilter}) {
            desc=`{get_file_title $i}
            u=`{echo $i|sed 's!'$sitedir'!!; '$dirclean's!/index$!/!; '}
            if(! ~ $#desc 0 && ! ~ $desc '')
                desc=' - '$"desc
            n=`{echo /$u|sed 's/[\-_]/ /g; s,.*/([^/]+)/?$,\1,'}
            echo '<li><a href="'$u'">'^$"n^'</a>' $"desc '</li>' 
            echo $base_url^$u >> $tmpfile
            echo '<url><loc>'$base_url^$u'</loc></url>' >> $tmpfilex
            if(test -d $i)
                @{ listDir $i }
        }
        echo '</ul>'
    }
}


fltr_cache listDir $sitedir/

if(test -s $tmpfile) {
    mv $tmpfile $sitedir/sitemap.txt &
}
if not if(test -f $tmpfile)
    rm $tmpfile

if(test -s $tmpfilex) {
    {
        echo '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">'

        cat $tmpfilex
        rm $tmpfilex &
        echo '</urlset>'
        # TODO Enable automaic search engine update notification.
        #hget 'http://google.com/ping?sitemap='^`{url_encode $base_url'/sitemap.gz'} > /dev/null
    
    } | gzip > $sitedir/sitemap.gz &
    #} > $sitedir/sitemap.xml &
}
if not if(test -f $tmpfilex)
    rm $tmpfilex

%}
