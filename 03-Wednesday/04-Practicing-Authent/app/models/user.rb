class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, length: { maximum: 255 },
                  # format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }
   validates :password, presence: true, length: { minimum: 4 }

end
