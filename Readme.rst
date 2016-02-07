Worker Base
===========

Container with R libraries and Biodiversity tool pre installed.

Requirements
------------

This build file needs maxent.jar in the files subfolder. Makent.jar can be downloaded from https://www.cs.princeton.edu/~schapire/maxent/

Build
-----

.. code-block:: Shell

  docker build --rm=true -t hub.bccvl.org.au/bccvl/workerbase:1.0.0 .

Publish
-------

.. code-block:: Shell

  docker push hub.bccvl.org.au/bccvl/workerbase:1.0.0

