class Remark < ActiveRecord::Base
  belongs_to :comment
  attr_accessible :approved,
                  :author,
                  :author_email,
                  :author_url,
                  :content,
                  :referrer,
                  :user_agent,
                  :user_ip,
                  :comment_id
end
