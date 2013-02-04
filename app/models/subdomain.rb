class Subdomain < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_subdomains

  validates_format_of :name, with: /^[a-z0-9_]+$/, message: "must be lowercase alphanumerics only"
  validates_length_of :name, maximum: 32, message: "exceeds maximum of 32 characters"
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp', 'http', 'https'], message: "is not available"

  attr_accessible :name
end
