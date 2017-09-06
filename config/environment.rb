require 'bundler'
Bundler.require

DB = {
  conn: SQLite3::Database.new('db/twitter.db'),
  name: 'Twitter'
}

DB[:conn].results_as_hash = true

ActiveRecord::Base.establish_connection(
  {
    adapter: 'sqlite3',
    database: 'db/twitter.db'
  }
)

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

require_relative '../lib/dynamic_record.rb'
require_relative '../lib/tweet.rb'
require_relative '../lib/user.rb'
require_relative '../lib/tweets_app.rb'
