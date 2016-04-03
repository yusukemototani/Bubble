ActiveRecord::Base.establish_connection(
  ENV['DATABASE_URL']||'sqlite3:db/development.db')

class Contribution < ActiveRecord::Base
    belongs_to :category
    belongs_to :user
end

class Category < ActiveRecord::Base
    has_many :contributions
end

class User < ActiveRecord::Base
    has_many :contributions
    has_secure_password
end