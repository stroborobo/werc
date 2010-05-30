Configuring werc with Cherokee
==============================

Contributed by sqweek, thanks!

Cherokee Version 0.7.1
----------------------

    vserver!default!rule!600!only_secure = 0
    vserver!default!rule!600!handler = cgi
    vserver!default!rule!600!handler!error_handler = 1
    vserver!default!rule!600!handler!check_file = 1
    vserver!default!rule!600!handler!script_alias =
    /usr/local/werc/bin/werc.rc
    vserver!default!rule!600!handler!pass_req_headers = 0
    vserver!default!rule!600!match = directory
    vserver!default!rule!600!match!directory = /code
    vserver!default!rule!600!match!final = 1


Cherokee Version 0.5.3
----------------------

    Directory /code {
           Handler cgi {
               Scriptalias /usr/local/werc/bin/werc.rc
           }
    }


Isn't progress wonderful?
