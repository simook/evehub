class Post < ActiveRecord::Base
  attr_accessible :content, :created_by, :name, :title
end
