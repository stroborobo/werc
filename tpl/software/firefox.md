Firefox
=======

Performance and memory usage
----------------------------

I have to kill firefox after it has been running for a few days, because it using over 1Gb of ram and becomes so slow as to be unusable... even after I closed all windows and tabs and left only one window with a blank tab open!

And this happens every single time I run firefox (which fortunately it is not too often because on Plan 9 we have saner web browsers), in the end it always glops every single bit of free memory and slows down to a crawl.

Once I was so amused by this that I even had to take a screenshot, and after I killed it, when I tried to run it again I got this, lovely.

And note that of course I don't have flash, java or any such nonsense installed, so either it is firefox or one of the few hundred linux libraries it uses(I don't have any windows or OS X boxes, so I have no clue if it leaks this much on other platforms).

Every few days a new debian package shows up, and I naively await for the damned thing to download thinking that maybe they have fixed something... not such luck yet.

Firefox is the perfect example of all that is wrong with software today: out of control complexity, layers upon layers of badly thought out gratuitous abstractions, rampant abuse of libraries, etc. And I say this as someone that respects and appreciates the mozilla developers, and I know they are good people (I was at the first two European Mozilla Developers Conferences).

It is time for people to remember that simplicity is the most important value when building software, it is time to remember how to build small and simple programs that do one thing and do it well. But how can anyone do that with the ever growing tangle of standards?

And always remember that:

There are two ways of constructing a software design: One way is to make it so simple that there are obviously no deficiencies and the other way is to make it so complicated that there are no obvious deficiencies. -- C.A.R. Hoare, The 1980 ACM Turing Award Lecture

If your software is so complex you can't figure out how to fix a memory leak in less than twenty minutes, then you are doing something wrong, if the leak stays around for months, then maybe it is best that you give and start from scratch.


Alternatives
------------

* abaco
* charon
* mothra
* dillo
* gopher
