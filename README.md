# README

This rails app was created with the rails5 api mode.

it was tested with ruby 2.2.2 and the gems in the gemfile only.

e.g. rvm use 2.2.2
rvm gemset create railsgems
rvm gemset use railsgems
bundle install

required db is sqlite3. 

no performance requirements were provided, so caching is off and the db was left as sqlite3.

logging is on for ease of inspection

first: rake db:setup 
to run in development mode: rails server
to test: rails test

to run in production mode:

rake secret
xport SECRET_KEY_BASE='the_above_secret'
rake db:setup RAILS_ENV="production"
rails server -e production 

use curl commands like these to see it in action:

note that entity_tags must be an Array, even if only a single entry

curl -H "Content-Type: application/json" -X POST http://localhost:4000/tags -d '{"entity_type":"Product","entity_id":"1234","entity_tags":["Smallishereset"]}'
curl -H "Accept: application/json" http://localhost:4000/tags
curl -H "Accept: application/json" http://localhost:4000/stats
curl -H "Content-Type: application/json" http://localhost:4000/tag/1

