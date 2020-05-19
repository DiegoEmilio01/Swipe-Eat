# frozen_string_literal: true

class Restaurante < ApplicationRecord
  has_many_attached :imagenes
  validates :nombre, presence: { message: 'Ingresó un Nombre en blanco.' }
  validates :nombre, uniqueness: { message: 'Ya existe un restaurante con ese Nombre.' }
  validates :descripcion, presence: { message: 'Ingresó una Descripción en blanco.' }
  validates :descripcion, length: { within: 10..100, message: 'La Descripción debe tener un largo
                                    entre 10 a 100 carácteres inclusive.' }
end
