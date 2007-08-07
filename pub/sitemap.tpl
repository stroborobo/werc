<h1>Site map</h1>

%{

saveddf = $dirfilter
cpath = ''
rpath = `{pwd}
rpath = $rpath^'/'^$sitedir

fn getMdDesc {
    sed 's/^(.......................................................................................................[^ ]*).*$/\1/g; 1q' < $1 
}

fn listDir {
    cd $1
    dirfilter = $saveddf
    blogDirs = ()
    if (test -f _config)
        . _config

    echo '<ul>'

    if (! ~ $#blogDirs 0 || ~ $1 blog Blog )
        echo '' 
    if not {

    for ( i in `{ ls -d */ *.md *.html >[2]/dev/null |sed $dirfilter^'/index$/d;' } ) {
        cpath = `{ pwd | sed 's,^'^$"rpath/?^',,; s,//*,/,;' }
        if( ~ $#cpath 0 )
            cpath = ''

        desc = ''
        if (test -f $i.md) {
            desc = `{ getMdDesc $i.md }
        }
        if (test -f $i/index.md) {
            desc = `{ getMdDesc $i/index.md }
        }
        if (test -f $i.html) {
            # H1 is not reliable because htmlroff doesn't use it :(
            #desc = `{ cat $i.html |sed 32q | grep '<[Hh]1>' |sed 's/<[Hh]1>(.*)(<\/[Hh]1>|$)/\1/;s/<[^>]*>//g;1q'  } 
            # Pick the first line of body  instead
            desc = `{ /bin/sed -e '0,/<[Bb][Oo][Dd][Yy]/d;s/<[^>]*>//g;/^$/d' < $i.html >[2]/dev/null | sed 1q }
        }
        if (! ~ $desc '')
            desc = ' - '$"desc
        tit = `{echo $i|sed 's/_/ /g'}
        echo '<li><a style="text-transform: capitalize" href="'$cpath/$i'">'^$"tit^'</a>' $desc '</li>' 
        if (test -d  $i)
            listDir $i
    }
    }
    echo '</ul>'
    cd ..
}
cd $sitedir
listDir .

%}