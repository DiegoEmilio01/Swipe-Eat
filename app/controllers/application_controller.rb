# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.class == Swiper
      home_root_path
    elsif resource.class == Admin
      admin_root_path
    elsif resource.class == Owner
      owner_root_path
    end
  end
end
