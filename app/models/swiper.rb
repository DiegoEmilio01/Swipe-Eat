# frozen_string_literal: true

class Swiper < ApplicationRecord
  has_many_attached :imagenes
  #------------------------------------------------------
  # Relaciones
  # Acepta Swiper-Swiper
  has_and_belongs_to_many(:aceptados,
                          class_name: 'Swiper',
                          join_table: 'aceptados',
                          foreign_key: 'swiper_acepta_id',
                          association_foreign_key: 'swiper_aceptado_id')
  # Bloquea Swiper-Swiper
  has_and_belongs_to_many(:bloqueados,
                          class_name: 'Swiper',
                          join_table: 'bloqueados',
                          foreign_key: 'swiper_bloquea_id',
                          association_foreign_key: 'swiper_bloqueado_id')
  # Match Swiper-Swiper
  has_and_belongs_to_many(:matchs,
                          class_name: 'Swiper',
                          join_table: 'matchs',
                          foreign_key: 'swiper_match_id',
                          association_foreign_key: 'swiper_matched_id')
  # Reporta Swiper-Swiper
  has_many :reportes, foreign_key: :swiper_reporta_id
  has_many :swipers, through: :reportes, source: :swiper_reportado
  # Tiene Swiper-Gustos:n-n
  has_and_belongs_to_many :gustos, join_table: 'gustos_swiper', class_name: 'Gusto'
  # Pertenece Swiper-Comuna:n-1
  belongs_to :comuna
  # Favorece Swiper-Restaurante:n-n
  has_and_belongs_to_many :favoritos, join_table: 'favorecidos', class_name: 'Restaurante'
  # Mensajea Swiper-Swiper:n-n
  has_many :mensajes, foreign_key: :swiper_origen_id, dependent: :destroy
  has_many :swipers, through: :mensajes, source: :swiper_destino, dependent: :destroy
  # Cita Swiper-Swiper-Restaurante
  has_many :meets, foreign_key: :swiper_cita_id, dependent: :destroy
  has_many :swipers, through: :meets, source: :swiper_citado, dependent: :destroy
  # Comenta Swiper-Comentario
  has_many :comentarios, dependent: :destroy
  #------------------------------------------------------
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
  validates :gustos, presence: { message: 'vacio' }
end
