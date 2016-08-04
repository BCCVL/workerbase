Worker Base
===========

Container with R libraries and Biodiversity tool pre installed.

Requirements
------------

This build file needs maxent.jar in the files subfolder. Maxent.jar can be downloaded from https://www.cs.princeton.edu/~schapire/maxent/

Versioning:
-----------

  Version depends on base image used and tools installed. Base image really depends on date being built, as it will pull in latest distribution patches as well.

  There is no custom developed software installed in this image, so we are probably better off using date based image versions.

Environment Variables:
----------------------

  MAXENT::
    file path to maxent.jar

  PERL5LIB::
    set to include biodiverse perl library
