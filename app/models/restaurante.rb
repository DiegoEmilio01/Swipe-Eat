# frozen_string_literal: true

class Restaurante < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Pertenece Restaurante-Comuna:n-1
  belongs_to :comuna
  # Owns Owner-Restaurante:1-1
  belongs_to :owner
  # Favorece Swiper-Restaurante:n-n
  has_and_belongs_to_many :swipers, join_table: 'favorecidos', class_name: 'Swiper',
                                    dependent: :destroy
  # Cita Swiper-Swiper-Restaurante
  has_many :meets, dependent: :destroy
  # Comenta Restaurante-Comentario
  has_many :comentarios, dependent: :destroy
  #------------------------------------------------------
  has_many_attached :imagenes
  validates :nombre, presence: { message: 'Ingresó un Nombre en blanco.' }
  validates :nombre, uniqueness: { message: 'Ya existe un restaurante con ese Nombre.' }
  validates :descripcion, presence: { message: 'Ingresó una Descripción en blanco.' }
  validates :descripcion, length: { within: 10..100, message: 'La Descripción debe tener un largo
                                    entre 10 a 100 carácteres inclusive.' }
  validates :telefono, presence: { message: 'Ingresó un Teléfono en clanco.' }
  validates :telefono, format: { with: /\A\+569\d{8}\z/, message: 'El Teléfono debe ingresarse
                                 en formato: +56912345678' }
  validates :direccion, presence: { message: 'Ingresó una Descripción en clanco.' }
  validates :direccion, format: { with: /\A[a-zA-ZÀ-úñÑ ]+\d+\z/, message: 'La Dirección debe
                                  ingresarse en formato: Callejón Vicuña Mackenna 4860' }
end
