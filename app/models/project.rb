class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used

  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }

  belongs_to :author, class_name: "User"
end
