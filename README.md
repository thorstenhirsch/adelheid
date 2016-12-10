# Adelheid (or short: Adi)
Adelheid is an artifact database &amp; deployment monitor with a beautiful UI and an easy-to-use API. Her
purpose is to be informed about every deployment, so that she can tell you what is where in which version.

# Installation
You need a recent ruby installation with the builder gem ('''gem install builder'''). Then you can run
'''build''' to install all necessary ruby modules. If everything went fine '''rails s''' will start Adi.

'''bin/install''' will download & install the required software, if not available:
   * ruby (2.2 or above)
   * rails and all required gems
   * postgresql
   * mongodb

# Getting Started...
You start by defining your target environments. This can be a host, but you can also decide to have
multiple environments on one host.

You can optionally put your environments in groups. This will result in a different layout in the UI.

Now let's take a look at your deployment scripts / applications - can they authenticate?

Predefine artifacts?
Artfact hierarchy.

# The Overview
Here you see all your environments and the latest deployments. You can search in all environments or in a
specific one for artifacts, deployments by date & time, and ...?

# The Dashboard
Ever asked yourself how many deployments have been done in the last 7 days? Here's the answer.

# The Configuration

# Switching from the internal SQLite DB to an external DB

# Deployment with Capistrano to Nginx / Phusion Passenger

