class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      root_path(resource)
    else
      admin_path
    end
  end
  
    
  def after_sign_out_path_for(resource)
    
    case resource
    when :admin
      admin_session_path
    when :customer
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :address,
      :phone_number,
      ])
  end
end
