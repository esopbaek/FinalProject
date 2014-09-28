class User < ActiveRecord::Base
  has_one :diet_profile, dependent: :destroy
  has_one :social_profile, dependent: :destroy
  has_many :measurements, dependent: :destroy
  has_many :diary_pages, dependent: :destroy
  has_many :exercise_diary_pages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_attached_file :profile_photo, :styles => {
          :big => "600x600>",
          :small => "50x50#"
        }
        validates_attachment_content_type(
          :profile_photo,
          :content_type => /\Aimage\/.*\Z/
        )

  attr_reader :password
  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true

  before_validation :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
