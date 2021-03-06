class User < ActiveRecord::Base
	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

	validates :password_digest, length: { minimum: 6 }

	has_secure_password
 
  has_many :relationships, class_name:  "Relationship",
                                  foreign_key: "user_id",
                                  dependent:   :destroy
  has_many :topics, through: :relationships, source: :topic

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

    # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

    # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end


  def follow_topic(topic)
    relationship = Relationship.new
    relationship.topic_id = topic.id
    relationship.user_id = self.id
    if Relationship.where(:user_id=>self.id).where(:topic_id=>topic.id).any?
      
    else 
      relationship.save
    end 
  end

  def unfollow_topic(topic)
    Relationship.find(topic.relationships.first.id).destroy

  end 
end
