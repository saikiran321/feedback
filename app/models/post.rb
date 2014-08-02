class Post < ActiveRecord::Base

  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy
  has_many :notifications, inverse_of: :post
  has_and_belongs_to_many :tags
  has_many :follows
  has_many :users, through: :follows
  has_many :angers
  has_many :users, through: :angers

  validates :title, presence: true
  validates :tags, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :notifications_count, presence: true

  def self.search(search, designation)
    search_condition = "%" + search + "%"
    where("#{designation} LIKE ?", "%#{search}%")
  end

  def following?(user)
    follows.where("user_id=?", user.id)
  end

  def follow!(user)
    self.follows.create!(user_id: user.id)
    @notf = Notification.new
    @notf.user_id = self.user_id
    @notf.post_id = self.id
    @notf.notif_user = user.id
    @notf.action = "is now following you"
    @notf.save
  end

  def unfollow!(user)
    follows.find_by(user_id: user.id).destroy
  end

end
