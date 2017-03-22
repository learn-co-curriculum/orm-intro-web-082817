class Tweet
  attr_accessor :message, :username
  ALL = []

  def self.all
    ALL
  end

  def initialize(options={})
    @message = options['message']
    @username = options['username']
    ALL << self
  end
end
