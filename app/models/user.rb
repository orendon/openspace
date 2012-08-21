# Usuario del Open Space
class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :nickname
  ROLES = %w[admin event_admin assistant guest].freeze
  has_many :sessions
  validates_inclusion_of :role, :in => ROLES
  validates_presence_of :provider, :uid, :name, :nickname
    
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.nickname = auth["info"]["nickname"]
      user.role = 'assistant'
    end
  end
  
  def admin?
    role == 'admin'
  end
  
end