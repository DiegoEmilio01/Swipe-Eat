# frozen_string_literal: true

class RestaurantesController < ApplicationController
  def new
    @restaurante = Restaurante.new
  end

  def create
    restaurante_params = params.require(:restaurante).permit(:nombre, :owner_id, :comuna_id,
                                                             :direccion, :telefono,
                                                             :descripcion, imagenes: [])
    restaurante_params['owner_id'] = current_owner.id
    @restaurante = Restaurante.create restaurante_params
    if @restaurante.save
      redirect_to owner_root_path, notice: 'Restaurante creado exitosamente.'
    else
      redirect_to restaurante_new_path, notice: @restaurante.errors
    end
  end

  def index
    @restaurantes = if current_swiper
                      Restaurante.joins(:comuna).where('comunas.cuarentena = false AND '\
                                                                       "aceptado = 'Aceptado'")
                    else
                      Restaurante.all
                    end
    return unless params[:id] && params[:id_a]

    @swiper_cita_id = params[:id]
    @swiper_citado_id = params[:id_a]

    return unless params[:fav]

    @fav = params[:fav]
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
                                                             :aceptado, :direccion, :telefono,
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
    if current_admin
      redirect_to lista_restaurantes_path, notice: 'Restaurante eliminado exitosamente.'
    else
      redirect_to owner_root_path, notice: 'Restaurante eliminado exitosamente.'
    end
  end

  def delete_imagen
    @imagen = ActiveStorage::Attachment.find(params[:id_i])
    @imagen.purge
    aviso = 'Imagen del restaurante eliminada exitosamente.'
    redirect_to restaurante_path(params[:id_r]), notice: aviso
  end

  def filtro
    if (params[:filtro] == 'nombre') && current_swiper
      @filtrados = Restaurante.joins(:comuna).where('comunas.cuarentena = false '\
                                                    "AND aceptado = 'Aceptado' AND "\
                                                    'Restaurantes.nombre ~* ?',
                                                    '.*' + params[:input] + '.*')
    elsif (params[:filtro] == 'o_nombre') && current_swiper
      @filtrados = Restaurante.joins(:comuna).where('comunas.cuarentena = false '\
                                                    "AND aceptado = 'Aceptado'").order(:nombre)
    elsif (params[:filtro] == 'comuna') && current_swiper
      @filtrados = Restaurante.joins(:comuna).where('comunas.cuarentena = false AND '\
                                                    "comuna_id = ? AND aceptado = 'Aceptado'",
                                                    params[:input])
    elsif params[:filtro] == 'nombre'
      @filtrados = Restaurante.where('nombre ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'o_nombre'
      @filtrados = Restaurante.order(:nombre)
    elsif params[:filtro] == 'comuna'
      @filtrados = Restaurante.where('comuna_id = ?', params[:input])
    end

    return unless params[:id] && params[:id_a]

    @swiper_cita_id = params[:id]
    @swiper_citado_id = params[:id_a]
  end

  def stats
    param = params[:rid]
    @restaurante = Restaurante.find param
    @citas_agendadas = Meet.where(@restaurante.id == 'restaurante_id').length
    @citas_efectuadas = Meet.where(@restaurante.id == 'restaurante_id')
                            .where('fecha < ?', DateTime.now).length
    @n_comentarios = @restaurante.comentarios.length
    @valoracion = (@restaurante.comentarios.sum(:valoracion).to_f / @restaurante.comentarios.length)
  end

  def pendientes
    @restaurantes = Restaurante.where('aceptado': 'Pendiente')
  end
end
