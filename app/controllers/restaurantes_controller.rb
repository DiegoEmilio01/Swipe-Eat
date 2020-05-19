# frozen_string_literal: true

class RestaurantesController < ApplicationController
  def new
    @restaurante = Restaurante.new
  end

  def create
    restaurante_params = params.require(:restaurante).permit(:nombre, :descripcion, imagenes: [])
    @restaurante = Restaurante.create restaurante_params
    if @restaurante.save
      redirect_to restaurantes_new_path, notice: 'Guardado'
    else
      redirect_to restaurantes_new_path, notice: @restaurante.errors
    end
  end

  def index
    @restaurantes = Restaurante.all
  end

  def show
    @restaurante = Restaurante.find params[:id]
  end

  def edit
    @restaurante = Restaurante.find params[:id]
  end

  def update
    restaurante_params = params.require(:restaurante).permit(:nombre, :descripcion, imagenes: [])
    @restaurante = Restaurante.find params[:id]
    if @restaurante.update restaurante_params
      aviso_exito = 'Restaurante editado exitosamente.'
      redirect_to restaurante_path(@restaurante.id), notice: aviso_exito
    else
      redirect_to edit_restaurante_path(@restaurante.id), notice: @restaurante.errors
    end
  end

  def destroy
    @restaurante = Restaurante.find params[:id]
    @restaurante.destroy
    redirect_to lista_restaurantes_path, notice: 'Restaurante eliminado exitosamente.'
  end

  def delete_imagen
    @imagen = ActiveStorage::Attachment.find(params[:id_i])
    @imagen.purge
    aviso = 'Imagen del restaurante eliminada exitosamente.'
    redirect_to restaurante_path(params[:id_r]), notice: aviso
  end
end
