# frozen_string_literal: true

class Restaurante < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Pertenece Restaurante-Comuna:n-1
  belongs_to :comuna
  # Owns Owner-Restaurante:1-1
  belongs_to :owner
  # Favorece Swiper-Restaurante:n-n
  has_and_belongs_to_many :swipers, join_table: 'favorecidos', class_name: 'Swiper'
  # Cita Swiper-Swiper-Restaurante
  has_many :meets
  # Comenta Restaurante-Comentario
  has_many :comentarios
  #------------------------------------------------------
  has_many_attached :imagenes
  validates :nombre, presence: { message: 'Ingresó un Nombre en blanco.' }
  validates :nombre, uniqueness: { message: 'Ya existe un restaurante con ese Nombre.' }
  validates :descripcion, presence: { message: 'Ingresó una Descripción en blanco.' }
  validates :descripcion, length: { within: 10..100, message: 'La Descripción debe tener un largo
                                    entre 10 a 100 carácteres inclusive.' }
end
