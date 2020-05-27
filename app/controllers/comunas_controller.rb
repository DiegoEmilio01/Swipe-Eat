# frozen_string_literal: true

class ComunasController < ApplicationController
  def new
    @comuna = Comuna.new
  end

  def create
    comuna_params = params.require(:comuna).permit(:nombre, :cuarentena)
    @comuna = Comuna.create comuna_params
    if @comuna.save
      redirect_to comunas_new_path, notice: 'Guardado'
    else
      redirect_to comunas_new_path, notice: @comuna.errors
    end
  end

  def index
    @comunas = Comuna.all
  end

  def show
    @comuna = Comuna.find params[:id]
  end

  def edit
    @comuna = Comuna.find params[:id]
  end

  def update
    comuna_params = params.require(:comuna).permit(:nombre, :cuarentena)
    @comuna = Comuna.find params[:id]
    if @comuna.update comuna_params
      aviso_exito = 'Comuna editada exitosamente.'
      redirect_to comuna_path(@comuna.id), notice: aviso_exito
    else
      redirect_to edit_comuna_path(@comuna.id), notice: @comuna.errors
    end
  end

  def destroy
    @comuna = Comuna.find params[:id]
    @comuna.destroy
    redirect_to lista_comunas_path, notice: 'Comuna eliminada exitosamente.'
  end

  def filtro
    if params[:filtro] == 'nombre'
      @filtrados = Comuna.where('nombre ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'o_nombre'
      @filtrados = Comuna.order(:nombre)
    elsif params[:filtro] == 'cuarentena'
      @filtrados = Comuna.where('cuarentena = ?', params[:input])
    end
  end
end
