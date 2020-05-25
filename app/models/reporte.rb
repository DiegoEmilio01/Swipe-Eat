# frozen_string_literal: true

class Reporte < ApplicationRecord
  belongs_to :swiper_reporta, class_name: :Swiper
  belongs_to :swiper_reportado, class_name: :Swiper
end
