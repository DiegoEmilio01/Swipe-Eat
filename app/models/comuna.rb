# frozen_string_literal: true

class Comuna < ApplicationRecord
  validates :nombre, presence: { message: 'El Nombre no puede estar en blanco.' }
  validates :nombre, uniqueness: { message: 'Ya existe una comuna con ese Nombre.' }
end
