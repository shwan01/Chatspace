class Chat < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :message_or_image, presence: true

  mount_uploader :image, ImageUploader

  private
    def message_or_image
      message.presence or image.presence
    end
end
