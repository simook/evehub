class User < ActiveRecord::Base
  rolify

  has_one :character
  has_many :character_skills, :through => :characters
  has_many :character_certificates, :through => :characters
  has_many :character_attributes, :through => :characters
  has_many :killlogs, :through => :characters

  has_one :corporation
  has_many :starbases, :through => :corporation

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :username, :email, :password, :password_confirmation, :remember_me, :apikey, :secretkey, :primary_character_id, :apiverified, :corp_apikey, :corp_apisecret, :corporation_id

  after_create :seed_primary_character
  after_create :default_role

  private
  def seed_primary_character
    # lets go ahead and seed this character so the user has something to look at.
    EveCharacter::Sheet.delay.create(self)
    EveCharacter::Killmails.delay.create(self)
    EveCorporation::Sheet.delay.create(self)
  end

  def default_role
    self.add_role :user
  end
end
