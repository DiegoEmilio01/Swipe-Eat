# frozen_string_literal: true

class ComentariosController < ApplicationController
  def new
    @comentario = Comentario.new
    @swiper_id = params[:ids]
    @restaurante_id = params[:idr]
  end

  def create
    comentario_params = params.require(:comentario).permit(:contenido, :fecha, :valoracion,
                                                           :restaurante_id, :swiper_id)
    swiper_id = comentario_params['swiper_id']
    restaurante_id = comentario_params['restaurante_id']

    @comentarios_anteriores = Comentario.where('swiper_id = ? AND restaurante_id = ?',
                                               comentario_params['swiper_id'],
                                               comentario_params['restaurante_id'])
    @comentarios_anteriores&.each(&:destroy)

    @comentario = Comentario.create(comentario_params)
    if @comentario.save
      redirect_to lista_citas_path(swiper_id), notice: 'Comentario guardado'
    else
      redirect_to comentar_restaurante_path(swiper_id, restaurante_id), notice: @comentario.errors
    end
  end

  def index
    @comentarios = Comentario.all
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    comentario_params = params.require(:comentario).permit(:contenido, :fecha, :valoracion)
    @comentario = Comentario.find(params[:id])

    if @comentario.update(comentario_params)
      redirect_to comentario_path(@comentario.id), notice: 'Comentario editado.'
    else
      redirect_to edit_comentario_path(@comentario.id), notice: @comentario.errors
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    redirect_to comentarios_path, notice: 'Comentario eliminado definitivamente.'
  end

  def filtro
    input = '.*' + params[:input] + '.*'
    @filtrados = Comentario.where('contenido ~* ?', input) if params[:filtro] == 'contenido'
  end
end
