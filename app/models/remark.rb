class Remark < ActiveRecord::Base
  belongs_to :remarkable, polymorphic: true
  attr_accessible :approved,
                  :author,
                  :author_email,
                  :author_url,
                  :content,
                  :referrer,
                  :user_agent,
                  :user_ip,
                  :comment_id,
                  :remarkable,
                  :remarkable_id,
                  :remark

  scope :approved, where(approved: true)

  def approve!
    approved = true
    save!
  end

  validates :author, presence:true
  validates :author_email, presence:true
  validates :author_url, presence:true

end
