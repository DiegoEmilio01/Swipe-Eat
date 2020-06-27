# frozen_string_literal: true

class OwnerReporteController < ApplicationController
  def new
    @comentario_id = params[:cid]
  end

  def create
    reporte_params = params.permit(:contenido, :owner_id,
                                   :comentario_id)

    @reporte = OwnerReporte.create reporte_params
    comentario_id = params[:comentario_id]

    if @reporte.save
      redirect_to restaurante_path(current_owner.restaurante.id), notice: 'reporte enviado'
    else
      redirect_to owner_reporte_path(comentario_id), notice: @reporte.errors
    end
  end

  def show
    @reporte = OwnerReporte.find params[:rid]
    @comentario = Comentario.find @reporte.comentario_id
    @swiper = Swiper.find @comentario.swiper.id
  end

  def index
    @reportes = OwnerReporte.all
  end

  def destroy
    @reporte = OwnerReporte.find params[:rid]
    OwnerReporte.all.delete(@reporte)

    redirect_to owner_reportes_path, notice: 'reporte eliminado exitosamente.'
  end
end
