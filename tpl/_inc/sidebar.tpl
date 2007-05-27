echo '<p class="sideBarTitle">Considered harmful:</p>'
fn menu {
    ls -F $1 | sed -e 's,^./,,' -e 's,\.md$,,' | grep -v '^_'| awk '
    BEGIN { print "<ul class=\"sidebar\">" }
    END { print "</ul>" }
    /^([a-zA-Z0-9_\-]+[\/*]?)+$/ && ! /index$/ {
        isdir = match($0, "/$")
        sub("[*/]$", "") # The '*' makes no sense to me
        
        if(isdir)
            d = "/"
        bname = $0
        sub("^(.*/)?([0-9]+_)?", "", bname)
        gsub("_", " ", bname)

        bname = bname d

        if(index(ENVIRON["REQUEST_URI"], "/" $0) == 1) {
            if(isdir) {
                print "<li><a href=\"/" $0 d "\">&raquo;<i> " bname "</i></a>"
                system("rc -c ''menu " $0 "''")
            } else {
                print "<li><a href=\"/" $0 d "\" class=\"thisPage\">&raquo;<i> " bname "</i></a>"
            }
        } else 
            print "<li><a href=\"/" $0 d "\">&rsaquo; " bname "</a>"

        print "</li>"

    }'

}
cd tpl
menu .
cd ..
