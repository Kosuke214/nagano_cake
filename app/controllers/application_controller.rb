class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

    def after_admin_sign_in_path_for(resource)
      root_url  "admin_path"
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number, :password, :is_deleted])
  end
end
