class Client < ActiveRecord::Base
	attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
  mount_uploader :resume, PictureUploader
  validate  :resume_size

  # Returns the hash digest of the given string.
  def Client.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private

    # Validates the size of an uploaded picture.
    def resume_size
      if resume.size > 5.megabytes
        errors.add(:resume, "should be less than 5MB")
      end
    end
end
