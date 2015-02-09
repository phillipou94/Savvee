class Relationship < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :topic, class_name: "Topic"
  validates :user_id, presence: true
  validates :topic_id, presence: true
  
end
