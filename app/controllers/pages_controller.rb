# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def swipers_mostrados
    @swiper = Swiper.find params[:id]
    @swipers_all = Swiper.all
    @swipers_recomendados = []
    @swipers_all.each do |swiper_all|
      added = false
      swiper_all.gustos.each do |gusto|
        next unless @swiper.gustos.include?(gusto) && !added && \
                    !@swiper.aceptados.include?(swiper_all) && \
                    !@swiper.bloqueados.include?(swiper_all)

        @swipers_recomendados << swiper_all unless @swiper == swiper_all
        added = true
      end

      # if !added && (@swiper.comuna == swiper_all.comuna) &&
      #   (@swipers_recomendados.length < 5) && (@swiper == swiper_all)
      #  @swipers_recomendados << swiper_all unless @swiper.aceptados.inlude?(swiper_all)
      # end
    end
    @swipers_recomendados.shuffle
  end

  def aceptar
    @swiper = Swiper.find params[:id]
    @aceptado = Swiper.find params[:id_a]
    @swiper.aceptados << @aceptado
    # Se verifica si el otro usuario tambien nos acepto para hacer match
    if @aceptado.aceptados.include?(@swiper)
      @swiper.matchs << @aceptado
      @aceptado.matchs << @swiper
    end
    redirect_to aceptando_path(@swiper.id)
  end

  def lista_matchs
    @swiper = Swiper.find params[:id]
  end

  def eliminar_match
    @swiper = Swiper.find params[:id]
    eliminado = Swiper.find params[:id_d]

    @swiper.matchs.delete(eliminado)
    eliminado.matchs.delete(@swiper)

    redirect_to lista_matchs_path(@swiper.id)
  end

  def choose_restaurante
    @citado_id = params[:id_a]
  end

  def agendar_cita
    @swiper = Swiper.find params[:id]
    @citado = Swiper.find params[:id_a]

    redirect_to restaurantes_cita_path(@swiper.id, @citado.id, 0)
  end

  def agendar_fecha
    @swiper = Swiper.find params[:id]
    @citado = Swiper.find params[:id_a]
    @restaurante = Restaurante.find params[:id_r]
  end

  def mensajes
    @mensajes = Mensaje.where('swiper_origen_id = ? AND '\
                              'swiper_destino_id = ?',
                              params[:id], current_swiper.id).or(Mensaje.where(
                                                                   'swiper_destino_id = ? AND '\
                                                                   'swiper_origen_id = ?',
                                                                   params[:id], current_swiper.id
                                                                 ))
    @mensajes = @mensajes.order(:created_at)
    @destinatario = Swiper.find(params[:id])
  end

  def crear_mensaje
    @mensaje = Mensaje.create swiper_origen_id: current_swiper.id,
                              swiper_destino_id: params[:id],
                              contenido: params[:contenido]
    @mensaje.save
    redirect_to mensajes_path(params[:id])
  end

  def add_favorito
    @swiper = Swiper.find params[:id]
    @restaurante = Restaurante.find params[:idr]

    @swiper.favoritos << @restaurante unless @swiper.favoritos.include?(@restaurante)

    redirect_to lista_citas_path
  end

  def delete_favorito
    @swiper = Swiper.find params[:id]
    @restaurante = Restaurante.find params[:idr]

    @swiper.favoritos.delete(@restaurante)

    redirect_to rest_cita_fav_path(params[:id], params[:id_a], params[:idr])
  end
end
