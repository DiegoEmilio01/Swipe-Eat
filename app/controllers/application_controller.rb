# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    if _resource.class == Swiper
      home_root_path
    elsif _resource.class == Admin
      admin_root_path
    end
  end
end
