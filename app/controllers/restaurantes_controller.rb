# frozen_string_literal: true

class RestaurantesController < ApplicationController
  def new
    @restaurante = Restaurante.new
  end

  def create
    restaurante_params = params.require(:restaurante).permit(:nombre, :owner_id, :comuna_id,
                                                             :descripcion, imagenes: [])
    restaurante_params['owner_id'] = current_owner.id
    @restaurante = Restaurante.create restaurante_params
    if @restaurante.save
      redirect_to restaurantes_new_path, notice: 'Guardado' # ARREGlAR DESPUES
    else
      redirect_to restaurantes_new_path, notice: @restaurante.errors
    end
  end

  def index
    if current_swiper
      @restaurantes = Restaurante.where("aceptado = 'Aceptado'")
    else
      @restaurantes = Restaurante.all
    end
    return unless params[:id] && params[:id_a]

    @swiper_cita_id = params[:id]
    @swiper_citado_id = params[:id_a]
  end

  def show
    if params[:id] && params[:id_a] && params[:id_r]
      @swiper_cita_id = params[:id]
      @swiper_citado_id = params[:id_a]
      @restaurante = Restaurante.find params[:id_r]
      @bool = params[:bool] if params[:bool]
    else
      @restaurante = Restaurante.find params[:id]
    end
  end

  def edit
    @restaurante = Restaurante.find params[:id]
  end

  def update
    restaurante_params = params.require(:restaurante).permit(:nombre, :owner_id, :comuna_id,
                                                             :aceptado,
                                                             :descripcion, imagenes: [])
    @restaurante = Restaurante.find params[:id]
    restaurante_params['owner_id'] = @restaurante.owner.id
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

  def filtro
    if current_swiper
      if params[:filtro] == 'nombre'
        @filtrados = Restaurante.where("nombre ~* ? AND aceptado = 'Aceptado'", '.*' + params[:input] + '.*')
      elsif params[:filtro] == 'o_nombre'
        @filtrados = Restaurante.where("aceptado = 'Aceptado'").order(:nombre)
      elsif params[:filtro] == 'comuna'
        @filtrados = Restaurante.where("comuna_id = ? AND aceptado = 'Aceptado'", params[:input])
      end
    else
      if params[:filtro] == 'nombre'
        @filtrados = Restaurante.where('nombre ~* ?', '.*' + params[:input] + '.*')
      elsif params[:filtro] == 'o_nombre'
        @filtrados = Restaurante.order(:nombre)
      elsif params[:filtro] == 'comuna'
        @filtrados = Restaurante.where('comuna_id = ?', params[:input])
      end
    end
    return unless params[:id] && params[:id_a]
    @swiper_cita_id = params[:id]
    @swiper_citado_id = params[:id_a]
  end
end
