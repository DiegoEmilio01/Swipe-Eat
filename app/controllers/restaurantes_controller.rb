# frozen_string_literal: true

class RestaurantesController < ApplicationController
  def new
    @restaurante = Restaurante.new
  end

  def create
    restaurante_params = params.require(:restaurante).permit(:nombre, :descripcion, :valoracion, imagenes: [])
    @restaurante = Restaurante.create restaurante_params
    if @restaurante.save
      redirect_to restaurantes_new_path, notice: 'Restaurante creado exitosamente.'
    else
      redirect_to restaurantes_new_path, notice: 'Error al intentar crear el restaurante.'
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
    restaurante_params = params.require(:restaurante).permit(:nombre, :descripcion, :valoracion, imagenes: [])
    @restaurante = Restaurante.find params[:id]
    if @restaurante.update restaurante_params
      aviso_exito = 'Restaurante editado exitosamente.'
      redirect_to restaurante_path(@restaurante.id), notice: aviso_exito
    else
      aviso_fracaso = 'Error al intentar editar el restaurante.'
      redirect_to restaurante_path(@restaurante.id), notice: aviso_fracaso
    end
  end

  def destroy
    @restaurante = Restaurante.find params[:id]
    @restaurante.destroy
    redirect_to lista_restaurantes_path, notice: 'Restaurante eliminado exitosamente.'
  end
end
