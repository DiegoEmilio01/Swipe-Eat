# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  prepend_before_action :require_no_authentication, only: :cancel
  #prepend_before_filter :require_no_authentication, only: :cancel
  #skip_before_action :require_login, only: [:new, :create], raise: false
  #skip_before_filter :require_login, only: [:new, :create], raise: false
  #skip_before_action :authorise, only: :new, raise: false


  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit_admin
    @admin = Admin.find params[:id]
  end

  def sign_up(resource_name, resource); end

  def update_admin
    new_params = params.require(:admin).permit(:email, :nombre)

    @admin = Admin.find params[:id]
    
    if @admin.update_without_password(new_params)
      aviso = 'Admin editado exitosamente.'
      redirect_to admin_path(@admin.id), notice: aviso
    else
      redirect_to admin_edit_admin_path(@admin.id), notice: @admin.errors
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
    new_params = params.require(:admin).permit(:email, :current_password, :password,
                                               :password_confirmation, :nombre)
    change_password = true
    if params[:admin][:password].blank?
      params[:admin].delete('password')
      params[:admin].delete('password_confirmation')
      new_params = params.require(:admin).permit(:email, :nombre)
      change_password = false
    end

    @admin = Admin.find(current_admin.id)

    is_valid = if change_password
                 @admin.update_with_password(new_params)
               else
                 @admin.update_without_password(new_params)
               end

    if is_valid
      #set_flash_message :notice, :updated
      sign_in @admin, bypass: true
      aviso = 'Admin editado exitosamente.'
      redirect_to admin_path(@admin.id), notice: aviso
    else
      render 'edit'
    end
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
