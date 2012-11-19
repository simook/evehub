class User < ActiveRecord::Base
  rolify
  belongs_to :corporations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :username, :email, :password, :password_confirmation, :remember_me, :apikey, :secretkey, :primary_character_id, :apiverified, :corp_apikey, :corp_apisecret, :corporation_id

end
