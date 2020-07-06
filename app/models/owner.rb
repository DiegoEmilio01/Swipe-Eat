# frozen_string_literal: true

class Owner < ApplicationRecord
  #------------------------------------------------------
  # Relaciones
  # Owns Owner-Restaurante:1-1
  has_one :restaurante, dependent: :destroy
  #------------------------------------------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nombre, presence: { message: 'vacio' }
  validates :nombre, uniqueness: { message: 'existe' }
end
