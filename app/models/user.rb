class User < ActiveRecord::Base
  establish_connection "students_1415"

  has_many :posts, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
  has_many :notifications, inverse_of: :user, dependent: :destroy
  has_many :follows
  has_many :posts, through: :follows
  has_many :angers
  has_many :posts, through: :angers
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/uploads/:style/user-default-blue.png"
  validates_attachment_content_type :avatar,allow_blank:true,:content_type => ['image/jpeg','image/png','image/gif']
  before_create :create_remember_token
  before_save {self.username = username.upcase }

  #has_secure_password

  validates :fullname, presence: true, length: {maximum: 50}
  validates :nick, presence: true, length: {maximum: 20}
  validates :room, presence: true, format: {with: /\A\d{3,4}\z/}
  #validates :password, length: { minimum:4 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: {is: 8}
  validates :notifications_count, presence: true
  validates :contact,presence: true,format: {with: /\A\d{10}\z/}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
