class Topic < ActiveRecord::Base
	has_many :users, through: :relationships, source: :user
end
