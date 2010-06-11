Development Roadmap
===================

The versioning scheme is a mess, originally even minor version numbers were
supposed to be stable and odd ones development branches, but turns out that for
the most part it is easier to do incremental development instead of keeping
'dev' and 'stable' branches.

A development branch might be added in the future if the changes are radical
enough and break backwards compatibility in some important way. For this the
deprecated and currently outdated `werc-dev` mercurial repo will be used.


Werc 1.5.x
----------

Planed major changes in 1.5

* Include required p9p binaries in standard distribution (or with some easy to deploy packaging).
* New/rewritten css layout, perhaps using fluid960gs? 
* File upload support [*Code contributed by maht, needs integration*]
* OpenID support [*Code contributed by maht, also needs integration*]
* More complete test suite.


Werc 1.4.x, current stable branch
---------------------------------

* Mostly bugfixes, documentation work, and minor improvements.


Werc 1.2.x, previous stable branch
----------------------------------

* Only security fixes.


Werc 1.1.x dev branch
---------------------

* Convert all templates and pages to HTML 5. [*Done*]
* Include new markdown implementation in pure awk by yuyis.[*Done*]
* Native Plan 9 httpd works out of the box. [*Mostly done*]
* Support for Google's Pubsubhubbub. [*Experimental implementation already done*]
* Include test suite/site (also to be hosted at http://tst.cat-v.org) [*In Progress*]


Werc 1.0.x
----------

* Abandoned, please upgrade.


-----------------------------------------------------

Werc 2.0 Plans
--------------

* Big redesigns / rewrites.
* Any non-backwards compatible changes.
* Bring some sanity to the function/config-variable naming insanity.
* Nothing else planned yet.
