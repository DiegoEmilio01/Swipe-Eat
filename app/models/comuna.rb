# frozen_string_literal: true

class Comuna < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Pertenece Swiper-Comuna:n-1
  has_many :swipers
  # Pertenece Restaurante-Comuna:n-1
  has_many :restaurantes
  #------------------------------------------------------
  validates :nombre, presence: { message: 'El Nombre no puede estar en blanco.' }
  validates :nombre, uniqueness: { case_sensitive: false, message: 'Ya existe
                                   una comuna con ese Nombre.' }
end
