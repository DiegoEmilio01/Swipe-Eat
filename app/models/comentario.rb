# frozen_string_literal: true

class Comentario < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Reporta Owner-Comentario:1-n
  belongs_to :owner
  #------------------------------------------------------

  validates :contenido, presence: { message: 'Ingresó un Contenido en blanco.' }
  validates :fecha, presence: { message: 'Ingresó una Fecha en blanco.' }
  validates :valoracion, presence: { message: 'Ingresó una Valoración en blanco.' }
  validates :valoracion, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10,
                                         message: 'La valoración ingresada es incorrecta.
                                         Debe ingresar un número entre 0.0 y 10.0 inclusivos.' }
end
