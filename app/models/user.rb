class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_one_attached :image

validates :name, presence: true
validates :introduction, presence: true


def get_profile_image(width,height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-user1.jpg')
    attached_image = profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    if attached_image
      profile_image = attached_image.attachment
    end
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end
end
