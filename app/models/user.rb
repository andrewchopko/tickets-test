class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :admin]

  has_one :profile, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy

  after_create :create_profile

  def create_profile
    profile = Profile.new(user_id: self.id)
    profile.save
  end
end
