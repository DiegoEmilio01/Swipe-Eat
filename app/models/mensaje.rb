# frozen_string_literal: true

class Mensaje < ApplicationRecord
  belongs_to :swiper_origen, class_name: :Swiper
  belongs_to :swiper_destino, class_name: :Swiper
end
