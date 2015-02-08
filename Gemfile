source "https://rubygems.org"

gem "rails",                "4.2.0"
gem "haml",                 "~> 4.0.5"
gem "sidekiq",              "3.3.2"
gem "rest-client",          "1.7.2",    require: false
gem "google-api-client",    "0.8.2",    require: false
gem "pg",                   "~> 0.17.1"
gem "newrelic_rpm",         "3.9.9.275"
gem "twitter",              "5.13.0",   require: false
gem "whenever",             "0.9.4",    require: false
gem "sinatra",              "1.4.5",    require: false
gem "redis",                "3.2.0",    require: false

group :development, :test do
  gem "byebug"
  gem "web-console",        "~> 2.0"
  gem "spring"
  gem "better_errors"
  gem "binding_of_caller"
  gem "annotate"
  gem "capistrano",         "~> 3.1.0"
  gem "capistrano-rvm"
  gem "capistrano-rails",   "~> 1.1"
  gem "capistrano-bundler"
  gem "capistrano-sidekiq"
  gem "awesome_print"
end

group :production do
  gem "unicorn",            "4.8.3"
end
