Content-Type: text/html

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>

<meta name="verify-v1" content="6zEoK0WMlnLmIS/w7Pnh6+srZECHsvnMGN0kQmowSGk=" />

    <title>%($title '|' $site '|' $siteTitle $siteSubTitle %)</title>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="author" content="k" />

% if (! ~ $#meta_description 0)
%   echo '    <meta name="description" content="'$"meta_description'" />'
% if (! ~ $#meta_keywords 0)
%   echo '    <meta name="keywords" content="'$"meta_keywords'" />'

    <link rel="stylesheet" href="/pub/style/style.css" type="text/css" media="screen" title="default" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/vnd.microsoft.icon" />
%#    <link rel="stylesheet alternative" type="text/css" href="/pub/style/style_old.css" media="screen" title="Old Style" />
% if (test -f $sitedir/_style.css) {
    <link rel="stylesheet" href="/_style.css" type="text/css" media="screen" title="default" />
% }

    %($extraHeaders%)

</head>
<body>

