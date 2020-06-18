# frozen_string_literal: true

class OwnerReporte < ApplicationRecord
  belongs_to :owner, class_name: :Owner
  belongs_to :comentario, class_name: :Comentario
end
