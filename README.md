# mySociety Public Builds

This repository contains shared recipes for building our software and
dependencies in various formats and environments. With some adjustment,
re-users should be able to use these to create custom builds of their
own.

## Layout

Each subdirectory is named for the tool used for the build process, so
in order to use these you'll need to be at least broadly familiar with 
these and have them installed locally.

### Note on Docker

Where a project supports Docker, we'll include the relevant `Dockerfile`
in the project repository rather than here. The Docker builds in this 
repository will generally be dependencies and shared containers used in
our example Docker Compose environments.
