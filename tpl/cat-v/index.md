UNIX Style, or cat -v Considered Harmful
========================================

At the USENIX Summer Conference of 1983 [Rob Pike](http://herpolhode.com/rob/)
made a presentation titled '*UNIX Style, or cat -v Considered Harmful*' and
together with Brian Kernighan wrote the paper '*Program Design Design in the
UNIX Environment*' ([pdf version](unix_prog_design.pdf), [ps
version](unix_prog_design.ps)).

This was a prelude for their famous book [The Unix Programming
Environment](http://cm.bell-labs.com/cm/cs/upe/) that today is considered *the
bible of Unix*.

Unfortunately their advice has been completely ignored, and today Unix has become
overcome by exactly the kind of mistakes they warned against.


    Bell Laboratories

    Murray Hill, NJ (dec!ucb)wav!research!rob

    It seems that UNIX has become the victim of cancerous growth at the hands of
    organizations such as UCB. 4.2BSD is an order of magnitude larger than Version
    5, but, Pike claims, not ten times better.

    The talk reviews reasons for UNIX's popularity and shows, using UCB cat as a
    primary example, how UNIX has grown fat. cat isn't for printing files with line
    numbers, it isn't for compressing multiple blank lines, it's not for looking at
    non-printing ASCII characters, it's for concatenating files.

    We are reminded that ls isn't the place for code to break a single column into
    multiple ones, and that mailnews shouldn't have its own more processing or joke
    encryption code.

    Rob carried the standard well for the "spirit of UNIX," and you can look
    forward to a deeper look at the philosophy of UNIX in his forthcoming book.

