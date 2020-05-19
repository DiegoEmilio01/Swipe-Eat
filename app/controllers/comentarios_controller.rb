# frozen_string_literal: true

class ComentariosController < ApplicationController
  def new
    @comentario = Comentario.new
  end

  def create
    comentario_params = params.require(:comentario).permit(:contenido, :fecha, :valoracion)
    @comentario = Comentario.create(comentario_params)

    if @comentario.save
      redirect_to comentarios_new_path, notice: 'Guardado'
    else
      redirect_to comentarios_new_path, notice: @comentario.errors
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
end
