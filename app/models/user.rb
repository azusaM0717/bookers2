class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_one_attached :image

def get_image(width, height)
  if image.attached?
    image.variant(resize_to_limit: [width, height]).processed
  else
    file_path = Rails.root.join('app/assets/images/sample-user1.jpg')
    self.image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    image.variant(resize_to_limit: [width, height]).processed
  end
end
end
