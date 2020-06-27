# frozen_string_literal: true

class Swipers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def index
    @swipers = Swiper.all
  end

  def show
    @swiper = Swiper.find(params[:id])
  end

  def edit_admin
    @swiper = Swiper.find params[:id]
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def delete_imagen
    @imagen = ActiveStorage::Attachment.find(params[:id_i])
    @imagen.purge
    aviso = 'Imagen del Swiper eliminada exitosamente.'
    redirect_to swiper_path(params[:id_s]), notice: aviso
  end

  def update_admin
    @swiper = Swiper.find params[:id]

    preparams = params.require(:swiper)
    params = preparams.permit(:email, :nombre, :edad, :telefono, :cumpleanos,
                              :direccion, :comuna_id, :descripcion,
                              imagenes: [], gusto_ids: [])

    if @swiper.update_without_password(params)
      aviso = 'Swiper editado exitosamente.'
      redirect_to swiper_path(@swiper.id), notice: aviso
    else
      redirect_to admin_edit_swiper_path(@swiper.id), notice: @swiper.errors
    end
  end

  def destroy_admin
    @swiper = Swiper.find(params[:id])
    nombre = @swiper.nombre
    @swiper.destroy
    redirect_to lista_swipers_path, notice: "Se eliminó el Swiper: #{nombre}."
  end

  def filtro
    if params[:filtro] == 'nombre'
      @filtrados = Swiper.where('nombre ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'correo'
      @filtrados = Swiper.where('email ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'o_nombre'
      @filtrados = Swiper.order(:nombre)
    elsif params[:filtro] == 'o_correo'
      @filtrados = Swiper.order(:email)
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    gustos = sign_up_params[:gusto_ids]
    sign_up_params.delete(:gusto_ids)
    build_resource(sign_up_params)
    gustos&.each do |gusto_id|
      gusto = Gusto.find(gusto_id)
      @swiper.gustos << gusto unless @swiper.gustos.include?(gusto)
    end
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #  super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :edad, :telefono, :cumpleanos,
                                                       :direccion, :descripcion, :comuna_id,
                                                       imagenes: [], gusto_ids: []])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :edad, :telefono,
                                                              :cumpleanos, :direccion,
                                                              :descripcion, :comuna_id,
                                                              imagenes: [], gusto_ids: []])
  end

  def update
    new_params = params.require(:swiper).permit(:email, :current_password, :password,
                                                :password_confirmation, :nombre, :edad,
                                                :telefono, :cumpleanos, :direccion,
                                                :descripcion, :comuna_id,
                                                imagenes: [], gusto_ids: [])
    change_password = true

    if params[:swiper][:password].blank?
      params[:swiper].delete('password')
      params[:swiper].delete('password_confirmation')
      new_params = params.require(:swiper).permit(:email, :nombre, :edad, :telefono, :cumpleanos,
                                                  :direccion, :descripcion, :comuna_id,
                                                  imagenes: [], gusto_ids: [])
      change_password = false
    end

    @swiper = Swiper.find(current_swiper.id)

    is_valid = if change_password
                 @swiper.update_with_password(new_params)
               else
                 @swiper.gustos.each do |gusto|
                   @swiper.gustos.delete(gusto)
                 end
                 @swiper.update_without_password(new_params)
               end

    if is_valid
      # set_flash_message :notice, :updated
      sign_in @swiper, bypass: true
      aviso = 'Swiper editado exitosamente.'
      redirect_to swiper_path(@swiper.id), notice: aviso
    else
      render 'edit'
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up, keys: %i[nombre edad telefono
  #                                                       cumpleanos direccion descripcion])
  # end
  #
  ## If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: %i[nombre edad telefono
  #                                                              cumpleanos direccion descripcion])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    stored_location_for(resource) || home_root_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
