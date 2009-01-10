<h1>Site map</h1>

%{
tmpfile=/tmp/werc_sitemap_$pid.txt
echo '' > $tmpfile
saveddf=$dirfilter

fn getMdDesc {
    sed 's/^(.......................................................................................................[^ ]*).*$/\1/g; 1q' < $1 
}

fn listDir {
    d=$1
    if(~ $#d 0)
        d=''
    dirfilter=$saveddf
    blogDirs=()
    if(test -f $d/_werc/config)
        . ./$d/_werc/config

    echo '<ul class="sitemap-list">'

    # Don't hide blog dirs for now
    #if(! ~ $#blogDirs 0 || ~ $1 */blog */Blog)
    #    echo '' 
    #if not 
    if(! ~ $#redirectPermanent 1)
    {

    for(i in `{ls -dF $d^*/ $d^*.md $d^*.html $d^*.txt >[2]/dev/null | sed $dirfilter$dirclean}) {
        desc=''
        if(test -f $i.md)
            desc=`{getMdDesc $i.md}
        if not if(~ $i */ && test -f $i/index.md)
            desc=`{getMdDesc $i/index.md}
        if not if(test -f $i.html) {
            # H1 is not reliable because htmlroff doesn't use it :(
            #desc = `{cat $i.html |sed 32q | grep '<[Hh]1>' |sed 's/<[Hh]1>(.*)(<\/[Hh]1>|$)/\1/;s/<[^>]*>//g;1q'}
            # Pick the first line of body  instead
            desc=`{sed -n '/<[Bb][Oo][Dd][Yy]/,/./s/(<[^>]*>|$)//gp' < $i.html}
            if(~ $#desc 0)
                desc=`{sed 's/<[^>]*>//g; 1q' < $i.html}
            #desc=`{/bin/sed -e '0,/<[Bb][Oo][Dd][Yy]/d;s/<[^>]*>//g;/^$/d' < $i.html >[2]/dev/null | sed 1q}
        }

        if(! ~ $#desc 0 && ! ~ $desc '')
            desc=' - '$"desc
        tit=`{echo /$i|sed 's/_/ /g; s,.*/([^/]+)/?$,\1,'}
        echo '<li><a href="/'$i'">'^$"tit^'</a>' $"desc '</li>' 
        echo -n $base_url^$i >> $tmpfile
        if(test -d $i) {
            echo / >> $tmpfile	
            @{ listDir $i }
        }
        if not
            echo >> $tmpfile
    }
    }
    echo '</ul>'
}

cd $sitedir 
listDir ''

cp $tmpfile ./sitemap.txt
rm $tmpfile

%}
