<h1>Site map</h1>

%{
tmpfile=/tmp/werc_sitemap_$pid.txt
saveddf=$dirfilter

fn get_md_title {
    sed 's/^(................................................................[^ ]*).*$/\1/g; 1q' < $1 
}

fn get_html_title {
    # H1 is not reliable because htmlroff doesn't use it :(
    #desc=`{cat $1 | sed 32q | grep '<[Hh]1>' | sed 's/<[Hh]1>(.*)(<\/[Hh]1>|$)/\1/;s/<[^>]*>//g;1q'}
    # Pick the first line of body  instead
    desc=`{sed -n '/<[Bb][Oo][Dd][Yy]/,/./s/(<[^>]*>|$)//gp' < $1}
    if(~ $#desc 0)
        desc=`{sed 's/<[^>]*>//g; 1q' < $1}
}

fn get_file_title {
        
    if(~ $1 */) {
        if(test -f $1/index.md)
            get_md_title $1/index.md
        if not if(test -f $1/index.html)
            get_html_title $1/index.html
    }
    if not if(~ $1 *.md)
        get_md_title $1
    if not if(~ $1 *.html)
        get_html_title $1
    if not
        echo ''
}

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
            n=`{echo /$u|sed 's/_/ /g; s,.*/([^/]+)/?$,\1,'}
            echo '<li><a href="'$base_url$u'">'^$"n^'</a>' $"desc '</li>' 
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
