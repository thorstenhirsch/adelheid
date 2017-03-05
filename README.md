# Adelheid
Adelheid is an artifact database &amp; deployment monitor with a beautiful UI
and an easy-to-use API. Her purpose is to be informed about every deployment,
so that she can show you what is where in which version.
Adelheid is also good in creating statistics about your deployments.

# How Does It Work?
First you tell Adelheid about your identifiers and the attributes you're
interested in. Then you send all deployment data to Adelheid in json or xml
documents. She keeps those documents save in a MongoDB data store.

A synchronization process works on all incoming documents and copies the
identifiers and attributes you've set into a relational db, which becomes an
optimized store for the data you're interested in. Searching data will be fast
and statistics are right on your hand.
In case you forgot an attribute or change your mind about the identifiers
later, you can always update your settings and re-initiate a synchro nization.

# Installation
You need a recent ruby installation with the bundler gem ('''gem install bundler''').
Then you can run '''bundle''' to install all necessary ruby modules. If every-
thing went fine '''rails s''' will start adelheid.

'''bin/install''' will download & install the required software, if not available:
   * ruby (2.2 or above)
   * rails and all required gems
   * postgresql
   * mongodb

# Getting Started...
You start by defining your target environments. This can be a host, but you can also decide to have multiple environments on one host.

You can optionally put your environments in groups. This will result in a different layout in the UI.

Now let's take a look at your deployment scripts / applications - can they authenticate?

Predefine artifacts?
Artifact hierarchy.

Let's start with your customization: you need to explain adelheid your deploy-
ment data, e.g. setting the id by which your artifacts are distinguished. You
also need to provide an xpath or jsonpath expression, which adelheid will use
when parsing the deployment data. But don't worry too much about that now - you
can change these settings later as often as you like and rebundle your database.

# The Overview
Here you see all your environments and the latest deployments. You can search in all environments or in a
specific one for artifacts, deployments by date & time, and ...?

# The Dashboard
Ever asked yourself how many deployments have been done in the last 7 days? Here's the answer.

# The Configuration

# Switching from the internal SQLite DB to an external DB

# Deployment with Capistrano to Nginx / Phusion Passenger

# Architecture
The server is based on Ruby on Rails 5 and comes with two databases:

   * mongodb, the persistency layer for all deployment data, being sent to
     adelheid
   * postgresql, the data source for adelheid's web interface

You can always change the configuration of your custom data model, like adding
or removing searchable attributes. Adelheid will create indexes when necessary
and rebundle the entire postgresql database based on the mongodb data.

Deployment data can be provided to adelheid in the following ways:

   * adc, the adelheid client (included)
   * http(s) calls to the adelheid api
   * some mom tool ...maybe
   * json and xml files in adelheid's "input" directory (note: you need to
     activate the input file listener in the configuration)

Your browser will display new deployments instantly, since it opens a web-
socket connection that pushes new events to the browser in realtime. This
feature is based on RnR's ActiveCable.

# Adelheid in Production
You must provide some environment variables in order to run a secure Adelheid server:

   * devise_secret_key
   * devise_mailer_sender

Adelheid's webserver is Puma, which comes with Ruby-on-Rails 5.x. It can handle the
traffic of up to 50 users pretty well, maybe even 100 users. However if you have
even more users you might want to switch to Nginx or Apache with Passenger.

