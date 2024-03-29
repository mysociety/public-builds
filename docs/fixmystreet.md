# Customising FixMyStreet

We can't predict every possible way that you might want to use and configure
FixMyStreet, but see below for some common tasks.

Also see the FixMyStreet documentation for more information about
[using FixMyStreet in AWS](https://fixmystreet.org/install/ami/) and
[customising more generally](https://fixmystreet.org/customising/).

## Pre-configuring your instances

If you are running FixMyStreet in a production capacity, you may find yourself
needing to launch instances that are already pre-configured for your
environment. For example if you want to build a slim AMI and integrate with
RDS you'll need to ensure that when launched it has the required database
configuration in place.

### Including a copy of the configuration file at build

If you wish to provide a customised copy of the `general.yml`
FixMyStreet configuration file baked-in to an image (perhaps for an approach
based on an immutable deployment model) one method of doing this
is to create a file with the required settings locally and add it to your
custom image using a [file provisioner](https://www.packer.io/docs/provisioners/file.html)
that runs after the existing [shell provisioner](https://www.packer.io/docs/provisioners/shell.html).

For example:

```
...
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "curl -L -O https://raw.github.com/mysociety/commonlib/master/bin/install-site.sh",
        "sudo sh install-site.sh {{user `install_args`}} {{user `site_name`}} {{user `site_user`}} 2>&1"
      ]
    },
    {
      "type": "file",
      "source": "./files/general.yml",
      "destination": "/tmp/general.yml"
    },
    {
      "type": "shell",
      "inline": [
        "sudo mv /tmp/general.yml /var/www/fixmystreet/fixmystreet/conf/general.yml",
        "sudo chown {{user `site_user`}}:{{user `site_user`}} /var/www/fixmystreet/fixmystreet/conf/general.yml"
      ]
    }
  ]
}
```

You can then launch new instances confident that they are already configured for
your existing environment.

### Configuring an instance at launch

You may instead chose to seed the required file in some other way, perhaps using
User Data (see [the relevant AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html) for examples).

You could store a copy of our configuration file in a secure location and have
a script copy this into the right place and ensure the permissions were correct
when you launch an instance.

## Adding your own cobrand

If you want to build a custom AMI with [your own cobrand](https://fixmystreet.org/customising/)
baked in, we've provided a variation on our standard builder to cater for this.

First, create a directory under `files/` called `cobrand` and place your cobrand
files into it.

For example, if you maintain your cobrand in its own repository you could clone
a working copy as this directory.

Regardless of how you populate this, it should consist of something like the
following (all items optional):

```
files/cobrand/
    templates/web/(cobrand)/
    templates/email/(cobrand)/
    perllib/FixMyStreet/Cobrand/(CoBrand.pm)
    web/cobrands/(cobrand)/
```

Next, create a suitable configuration file and place this at `files/general.yml.cobrand`.

Finally you should be able to run `make fixmystreet-ami-cobrand` and the cobrand
files will be included and activated during the build process. This target uses
the `amazon_fms_cobrand.json` builder definition which will build a private AMI
by default. It will be named `fixmystreet-installation-full-cobrand-YYYY-MM-DD`.

## Building a slim AMI

**This process is under development and subject to change.**

The Packer `Makefile` contains a `fixmystreet-ami-slim` target that will create an AMI
without a locally installed database and memcache instance.

For this to be useful, you will need to ensure that the required services are
prepared and ensure that when you launch an instance is has the
necessary configuration available, possibly using one of the methods [above](#pre-configuring-your-instances).

### Requirements

* You will need a Postgres database endpoint accessible from your instances with
database and user. The database will need to have the current FixMyStreet schema
loaded for fresh installations.
* If you wish to use memcached, you will need to provide a suitable endpoint accessible
from the instances, then configure then with the endpoint address.
* You will need to provide a reverse proxy.

## Changing the version of FixMyStreet

By default, the build process for FixMyStreet images will use the most recent
[tagged release](https://github.com/mysociety/fixmystreet/releases). It is
possible to control this by injecting certain environment variables into the build.

The following variables can be used to control various aspects of the build:

* `VERSION_OVERRIDE` will set the branch, tag or commit checked out in the final
image (default: latest tagged release);
* `BRANCH_OVERRIDE` will set the branch used for the initial checkout that loads the
install script (default: `master`);
* `REPOSITORY_URL_OVERRIDE` will set the URL of the Git repository used (default: `https://github.com/mysociety/fixmystreet.git`).

These variables can be set by adding some `environment_vars` in the `shell`
provisioner, for example:
```
...
  "provisioners": [
    {
      "type": "shell",
      "environment_vars": [
        "VERSION_OVERRIDE=f935df04a"
      ],
      "inline": [
        "curl -L -O https://raw.github.com/mysociety/commonlib/master/bin/install-site.sh",
        "sudo -E sh install-site.sh {{user `install_args`}} {{user `site_name`}} {{user `site_user`}} 2>&1"
      ]
    }
  ]
...
```
See [the Packer documentation](https://www.packer.io/docs/provisioners/shell.html#environment_vars)
for more details on the `environment_vars` option.
