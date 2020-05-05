class Swiper < ApplicationRecord
    has_many_attached :imagenes
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
end
