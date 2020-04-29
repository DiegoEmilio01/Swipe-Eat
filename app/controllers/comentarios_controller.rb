# frozen_string_literal: true

class ComentariosController < ApplicationController
  def new
    @comentario = Comentario.new
  end

  def create
    comentario_params = params.require(:comentario).permit(:contenido, :fecha)
    @comentario = Comentario.create(comentario_params)

    if @comentario.save
      redirect_to comentarios_new_path, notice: 'Comentario publicado'
    else
      redirect_to comentarios_new_path, notice: 'Error al publicar comentario'
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
    comentario_params = params.require(:comentario).permit(:contenido, :fecha)
    @comentario = Comentario.find(params[:id])

    if @comentario.update(comentario_params)
      redirect_to comentario_path(@comentario.id), notice: 'Comentario editado'
    else
      msg = 'Hubo un error al editar el comentario'
      redirect_to comentario_path(@comentario.id), notice: msg
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    redirect_to comentarios_path, notice: 'Comentario eliminado definitivamente'
  end
end
