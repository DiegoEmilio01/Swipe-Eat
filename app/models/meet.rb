# frozen_string_literal: true

class Meet < ApplicationRecord
  belongs_to :swiper_cita, class_name: :Swiper
  belongs_to :swiper_citado, class_name: :Swiper
  belongs_to :restaurante, class_name: :Restaurante
end
