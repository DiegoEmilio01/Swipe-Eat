# frozen_string_literal: true

class Owners::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # prepend_before_action :require_no_authentication, only: [:new, :cancel]

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def edit_admin
    @owner = Owner.find params[:id]
  end

  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def update_admin
    @owner = Owner.find params[:id]

    preparams = params.require(:owner)
    params = preparams.permit(:email, :nombre)

    if @owner.update_without_password(params)
      aviso = 'Owner editado exitosamente.'
      redirect_to owner_path(@owner.id), notice: aviso
    else
      redirect_to admin_edit_owner_path(@owner.id), notice: @owner.errors
    end
  end

  def destroy_admin
    @owner = Owner.find(params[:id])
    nombre = @owner.nombre
    @owner.destroy
    redirect_to lista_owners_path, notice: "Se eliminó el Owner: #{nombre}."
  end

  def filtro
    if params[:filtro] == 'nombre'
      @filtrados = Owner.where('nombre ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'correo'
      @filtrados = Owner.where('email ~* ?', '.*' + params[:input] + '.*')
    elsif params[:filtro] == 'o_nombre'
      @filtrados = Owner.order(:nombre)
    elsif params[:filtro] == 'o_correo'
      @filtrados = Owner.order(:email)
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
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
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre])
  end

  def update
    new_params = params.require(:owner).permit(:email, :current_password, :password,
                                               :password_confirmation, :nombre)
    change_password = true
    if params[:owner][:password].blank?
      params[:owner].delete('password')
      params[:owner].delete('password_confirmation')
      new_params = params.require(:owner).permit(:email, :nombre)
      change_password = false
    end

    @owner = Owner.find(current_owner.id)

    is_valid = if change_password
                 @owner.update_with_password(new_params)
               else
                 @owner.update_without_password(new_params)
               end

    if is_valid
      # set_flash_message :notice, :updated
      sign_in @owner, bypass: true
      aviso = 'Owner editado exitosamente.'
      redirect_to owner_path(@owner.id), notice: aviso
    else
      render 'edit'
    end
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #  super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
