class User < ApplicationRecord

  after_initialize :ensure_session_token
  attr_reader :password
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 7, allow_nil: true }

  def self.find_by_credentials(uname, pword)
    # user = User.find_by(username: username)
    # user && user.is_password?(password) ? user : nil
    #This syntax MUST become muscle memory
    user = User.find_by(username: uname)
    user && user.is_password?(pword) ? user : nil
  end

  def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64
  end

  def self.generate_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    #assign, save, return.
    #assign, save , return
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def password=(pword)
    @password = pword
    self.password_digest = BCrypt::Password.create(pword)
  end

  def is_password?(pword)
    BCrypt::Password.new(self.password_digest).is_password?(pword)
  end



end
