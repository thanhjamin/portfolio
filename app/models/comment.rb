class Comment < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :author, class_name: "User"
end
