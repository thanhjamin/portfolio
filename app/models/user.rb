class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  has_many :comments, foreign_key:"author_id"
  has_many :projects, foreign_key:"author_id"

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end

end
