class Topic < ActiveRecord::Base
	has_many :relationships, class_name:  "Relationship",
                                  foreign_key: "topic_id" #foreign key for relationship, not topic
	has_many :users, through: :relationships, source: :user
end
