Sinatra app
===========

Written using _Sinatra_, _ActiveRecord_, and _Roar_.  _Rubocop_ is utilized
with _Guard_ to insure code quality.  Features were written using _Cucumber_
to test the endpoints for the nested resources: Artists, Albums, and Songs.

My objectives were:
* 3 linked entities: Artists, Albums, Songs~~
* Basic operations are implemented: ~~Create~~, ~~Read~~, ~~Update~~, ~~Destroy~~, Search
* Hypermedia API using HAL/JSON
* Supports multiple users and performs authentication with JSON Web Tokens
* ~~ORM: ActiveRecord using SQLite3 (Test/Development) and Postgres (Production)~~
* ~~Acceptance tests/documentation of API endpoints in Cucumber~~
* Simple client demonstrating the API
* ~~Rubocop compliant~~

I also decided to package the code with Docker.  To use the app:

`$ git clone git@github.com:michfarr/sinatra_activerecord_roar.git`

`$ docker-compose up`

`$ docker-compose run web rake db:create db:migrate db:seed`

__TODO__
* Implement Search
* Implement Users/Authentication
* Implement client
* Extend feature coverage for current content (and for new content)
