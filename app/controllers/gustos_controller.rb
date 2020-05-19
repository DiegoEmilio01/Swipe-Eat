# frozen_string_literal: true

class GustosController < ApplicationController
  def index
    @gustos = Gusto.all
  end

  def show
    @gusto = Gusto.find(params[:id])
  end

  def new
    @gustos = Gusto.new
  end

  def edit
    @gusto = Gusto.find(params[:id])
  end

  def update
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion)
    @gusto = Gusto.find(params[:id])
    if @gusto.update(gusto_params)
      redirect_to gusto_path(@gusto.id), notice: 'Gusto editado exitosamente.'
    else
      redirect_to edit_gusto_path(@gusto.id), notice: @gusto.errors
    end
  end

  def create
    gusto_params = params.require(:gusto).permit(:nombre, :descripcion)
    @gusto = Gusto.create(gusto_params)
    if @gusto.save
      redirect_to gustos_new_path, notice: 'Guardado'
    else
      redirect_to gustos_new_path, notice: @gusto.errors
    end
  end

  def destroy
    @gusto = Gusto.find(params[:id])
    nombre = @gusto.nombre
    @gusto.destroy

    redirect_to gustos_path, notice: "Se eliminó el gusto: #{nombre}"
  end
end
