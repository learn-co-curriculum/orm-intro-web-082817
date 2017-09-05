class Tweet
  attr_accessor :message, :username


  def self.all
    sql = <<-SQL
    SELECT * FROM tweets
    SQL

    DB[:conn].execute(sql)
  end

  def initialize(props={})
    @message = props['message']
    @username = props['username']
  end
end
