# frozen_string_literal: true

class MeetController < ApplicationController
  def create
    meet_params = params.permit(:swiper_cita_id, :swiper_citado_id, :fecha,
                                :restaurante_id)
    meet_params['estado'] = false
    @swiper_id = params[:swiper_cita_id]
    if !params[:fecha].empty? && !params[:fecha].nil?
      @meet = Meet.create meet_params
      if @meet.save
        @swiper_citado = Swiper.find params[:swiper_citado_id]
        return redirect_to lista_citas_path(@swiper_id), notice: 'Cita agendada'
      end
    end
    redirect_to fecha_cita_path(params[:swiper_cita_id], params[:swiper_cita_id],
                                params[:restaurante_id], 1), notice: 'Fecha no válida'
  end

  def accept
    @meet = Meet.find params[:mid]
    param = { estado: true }
    @meet.update param
    @swiper = Swiper.find(@meet.swiper_citado_id)
    redirect_to lista_citas_path(@swiper.id)
  end
end
