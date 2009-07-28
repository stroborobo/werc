<h1>Site map</h1>

%{
tmpfile=/tmp/werc_sitemap_$pid.txt
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
            if(test -d $i)
                @{ listDir $i }
        }
        echo '</ul>'
    }
}

fltr_cache listDir $sitedir/

if(test -s $tmpfile)
    mv $tmpfile $sitedir/sitemap.txt &

%}
