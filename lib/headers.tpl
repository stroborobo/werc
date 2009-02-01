% for(h in $extraHttpHeaders) echo $h
Content-Type: text/html

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>

    <title>%($pageTitle%)</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="k" />

% if (! ~ $#meta_description 0)
%   echo '    <meta name="description" content="'$"meta_description'" />'
% if (! ~ $#meta_keywords 0)
%   echo '    <meta name="keywords" content="'$"meta_keywords'" />'

    <link rel="stylesheet" href="/pub/style/style.css" type="text/css" media="screen, handheld" title="default" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon" />
% if (test -f $sitedir/_style.css) {
    <link rel="stylesheet" href="/_style.css" type="text/css" media="screen" title="default" />
% }

% h = `{ get_lib_file headers.inc}
% if(! ~ $#h 0)
%   cat $h

    %($"extraHeaders%)

</head>
<body>

