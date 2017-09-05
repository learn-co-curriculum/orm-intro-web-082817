require 'bundler'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/twitter.db'),
  name: 'Twitter'
}

DB[:conn].results_as_hash = true

# module SQLite3
#
#   class Database
#
#     def initialize(filename)
#       # ...
#     end
#   end
#
# end

require_relative '../lib/tweet.rb'
require_relative '../lib/tweets_app.rb'
