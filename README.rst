=====
NGinx
=====

NGinx with our customisations

ACME request limits
^^^^^^^^^^^^^^^^^^^

The RMAPI templates limit ACME requests to 6 per second per address and
30 per second per Nginx instance, with bursts of 16 and 60. Account registration
also has limits of 6 per minute per address and 30 per minute per instance,
with bursts of 4 and 12. All workers and RMAPI virtual hosts in one instance
share the budgets. Separate proxy replicas each have their own budgets.

Versioning
^^^^^^^^^^

Versioning is handled with bump-my-version_. To increment, use ``bump-my-version bump <patch/minor/major>``.

You can use ``bump-my-version show-bump`` to see how each option would affect the version.

  - Major, minor, and patch are NGinx SemVer
  - Build is change date for this repo

.. _bump-my-version: https://github.com/callowayproject/bump-my-version
