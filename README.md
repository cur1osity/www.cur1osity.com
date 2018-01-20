# Ruby on Rails - Twitter-like app + API

Backend partially based on [Michael Hartl's Rails tutorial](https://www.railstutorial.org/) and [Rails5_api_tutorial](https://github.com/vasilakisfil/rails5_api_tutorial) by Filippos Vasilakis.

<b> See it in action at https://www.cur1osity.com. </b>

In case of API you can register on page, activate and log-in then API-token key could be send to your email address after clicking on link (Account -> Send API token).

For Linux you could test it for example with cURL: curl -H 'Authorization: Token token="your_API_token", email="your_email_address"' https://www.cur1osity.com/api/v1/users/

### Prerequisites

Install [Ruby](https://www.ruby-lang.org/pl/documentation/installation/) and [Rails](https://gorails.com/setup)

Alternatively you can use [Docker](www.docker.com). Install docker CE from https://docs.docker.com/engine/installation/ 

### Installing

For linux installation - download app and type in root folder:

```
bundle update
rails db:migrate
rails db:seed
rails server
```
and go to http://localhost:3000

You can login with:
```
mail: example_user@example.com 
pass: password
```
For Docker - download app and type in root folder:

```
echo "FROM rails:onbuild" > Dockerfile
docker build -t rails-demo .
docker run --rm -p 3000:3000 rails-demo
```
and go to http://localhost:3000



