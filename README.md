# Meta Authentication Flow Example With Ruby Webrick Webserver

This tutorial will use Ruby in the Authentication Flow example app for [Meta Apps Facebook Login](https://developers.facebook.com/products/facebook-login/).

> This flow first gets a code from the Facebook Accounts Service, then exchanges that code for an access token. The code-to-token exchange requires a secret key, and for security is done through direct server-to-server communication.
In this example we retrieve data from the Web API /me endpoint, that includes information about the current user.

Here we will use Ruby for server-side applications.

## Installation
First you need to clone the repository.
```
$ git clone https://github.com/azolf/meta-web-api-auth-examples-ruby.git
```
Then you should go to the directory and install the required Gems.
```
$ cd meta-web-api-auth-examples-ruby/
$ bundle install
```

You could edit the Meta Client Id and Client Secret in `initializers/ruby_oauth.rb` file.
```
version: '3'
services:
  app:
    image: azolf/meta-web-api-auth-examples-ruby
    container_name: meta-web-api-auth-examples-ruby
    ports:
      - 8000:8000
    environment:
      - CLIENT_ID=YOUR_CLIENT_ID
      - CLIENT_SECRET=YOUR_CLIENT_SECRET
```

Or you could pass them as environemnt variables.
```
$ CLIENT_ID=YOUR_CLIENT_ID CLIENT_SECRET=YOUR_CLIENT_SECRET ruby server.rb
```

## Using Docker Image
You could also use pre built docker image.

```
$ docker pull azolf/meta-web-api-auth-examples-ruby
$ docker run -itd \
--name meta-web-api-auth-examples-ruby \
-p 8000:8000 \
-e CLIENT_ID=YOUR_CLIENT_ID \
-e CLIENT_SECRET=YOUR_CLIENT_SECRET \
azolf/meta-web-api-auth-examples-ruby:latest
```

## Using docker-compose
You could also clone the repository and start the container with the `docker-compose.yml` file. You just need to replace your Client Id and Client Secret in it.
```
version: '3'
services:
  app:
    image: azolf/meta-web-api-auth-examples-ruby
    container_name: meta-web-api-auth-examples-ruby
    ports:
      - 8000:8000
    environment:
      - CLIENT_ID=YOUR_CLIENT_ID
      - CLIENT_SECRET=YOUR_CLIENT_SECRET
```

```
$ docker-compose up -d
```

Then, open http://localhost:8000 in a browser.