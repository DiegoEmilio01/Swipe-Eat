# frozen_string_literal: true

class Gusto < ApplicationRecord
  # Relaciones
  # Tiene Swiper-Gustos:n-n
  has_and_belongs_to_many :gustos_swiper, join_table: 'gustos_swiper', class_name: 'Swiper'
  validates :nombre, presence: { message: 'Ingresó un Nombre en blanco.' }
  validates :nombre, uniqueness: { message: 'Ya existe un gusto con ese Nombre.' }
  validates :descripcion, presence: { message: 'Ingresó una Descripción en blanco.' }
  validates :descripcion, length: { within: 10..100, message: 'La Descripción debe tener un largo
                                    entre 10 a 100 carácteres inclusive.' }
end
