class Comment < ActiveRecord::Base
  attr_accessible :body, :title, :published, :content
  belongs_to :author, class_name: "User"
  has_many :remarks
  scope :published, where(published: true)

  def publish!
    published = true
    save!
  end
end
