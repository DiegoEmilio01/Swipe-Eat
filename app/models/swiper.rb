# frozen_string_literal: true

class Swiper < ApplicationRecord
  has_many_attached :imagenes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nombre, presence: { message: 'vacio' }
  validates :nombre, uniqueness: { message: 'existe' }
  validates :descripcion, presence: { message: 'vacio' }
  validates :descripcion, length: { within: 10..100, message: 'largo' }
  validates :edad, presence: { message: 'vacio' }
  validates :edad, numericality: { only_integer: true, greater_than_or_equal_to: 18,
                                   message: 'formato' }
  validates :telefono, presence: { message: 'vacio' }
  validates :telefono, format: { with: /\A\+569\d{8}\z/, message: 'formato' }
  validates :direccion, presence: { message: 'vacio' }
  validates :direccion, format: { with: /\A[a-zA-ZÀ-úñÑ ]+\d+\z/, message: 'formato' }
end
