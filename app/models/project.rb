class Project < ActiveRecord::Base
  attr_accessible :name, :technologies_used, :published, :image, :remote_image_url
  has_many :remarks, as: :remarkable
  belongs_to :author, class_name: "User"
  mount_uploader :image, ImageUploader

  validates :technologies_used, presence: true
  validates :name, length: { in: 4..255 }

  after_save :enqueue_image

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      project = Project.find(id)
      project.key = key
      project.remote_image_url = project.image.direct_fog_url(with_path: true)
      project.save!
      project.update_column(:image_processed, true)
    end
  end
end
