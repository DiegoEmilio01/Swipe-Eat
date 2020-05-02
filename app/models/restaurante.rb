class Restaurante < ApplicationRecord
    has_many_attached :imagenes
    #has_one_attached :imagenes
end
