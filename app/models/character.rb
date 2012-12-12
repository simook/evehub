class Character < ActiveRecord::Base
  belongs_to :user

  has_many :character_skills
  has_many :character_certificates
  has_many :character_attributes
  has_many :killlogs

  #before_create :character_info
  #after_create :character_skills
  #after_create :character_attributes
  #after_create :character_certificates
  #after_save :update_character

  attr_accessible :alliance_id, :alliance_name, :ancestry, :balance, :bloodline, :character_id, :clone_name, :clone_skill_points, :corporation_id, :corporation_name, :dob, :gender, :name, :race, :user_id, :killlog_cached_until

end
