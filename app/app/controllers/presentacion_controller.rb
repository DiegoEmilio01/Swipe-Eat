# frozen_string_literal: true

class PresentacionController < ApplicationController
  def informacion
    @grupo = ['Diego Bustamante', 'Lucas Muñoz', 'Elías Sabja']
    render 'informacion'
  end
end
