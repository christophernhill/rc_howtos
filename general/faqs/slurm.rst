===
FAQ
===

.. contents::
  :local:
  :backlinks: none

Why did my job die with a message like ``slurmstepd: Step 2152954.0 exceeded memory limit (23676644 > 16384000), being killed``?
--------------------------------------------------------------------------------------------------------------------------------
By default jobs run with some memory limit that may be lower than the physical memory on a node. This allows more jobs to fit on a node. Jobs that require



