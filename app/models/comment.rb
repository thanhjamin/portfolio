class Comment < ActiveRecord::Base
  attr_accessible :body, :title, :published
  belongs_to :author, class_name: "User"
  scope :published, where(published: true)

  def publish!
    published = true
    save!
  end
end
