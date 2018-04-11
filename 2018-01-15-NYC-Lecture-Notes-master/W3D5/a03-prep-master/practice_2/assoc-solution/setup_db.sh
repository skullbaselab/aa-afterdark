#!/usr/bin/env sh

bundle exec rails db:create
RAILS_ENV=test bundle exec rails db:create
bundle exec rails db:schema:load
bundle exec rails db:seed
rails db:environment:set RAILS_ENV=test
RAILS_ENV=test bundle exec rails db:schema:load
rails db:environment:set RAILS_ENV=test
RAILS_ENV=test bundle exec rails db:seed
