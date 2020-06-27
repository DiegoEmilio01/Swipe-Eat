# frozen_string_literal: true

class Comentario < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Comenta Restaurante-Comentario:1-n
  belongs_to :restaurante
  # Comenta Swiper-Comentario:1-n
  belongs_to :swiper
  # Reporta Owner-Comentario:1-n
  has_many :owner_reportes, dependent: :destroy
  #------------------------------------------------------

  validates :contenido, presence: { message: 'Ingresó un Contenido en blanco.' }
  validates :fecha, presence: { message: 'Ingresó una Fecha en blanco.' }
  validates :valoracion, presence: { message: 'Ingresó una Valoración en blanco.' }
  validates :valoracion, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5,
                                         message: 'La valoración ingresada es incorrecta.
                                         Debe ingresar un número entre 1 y 5 inclusivos.' }
end
