class Topic < ActiveRecord::Base
	has_many :relationships, class_name:  "Relationship",
                                  foreign_key: "topic_id" #foreign key for relationship, not topic
	has_many :users, through: :relationships, source: :user
	validates_uniqueness_of :name
	validates :name, presence: true, uniqueness: true

	before_validation :downcase_name

	 private

		def downcase_name
  			self.name = self.name.downcase if self.name.present?
		end
end
