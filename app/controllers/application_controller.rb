class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

    #def after_inactive_sign_up_path_for(resource)
    #  customers_my_page_path
    #end

    def after_sign_in_path_for(resource)
      case resource
      when Admin
        root_path
      when Customer
        root_path
      end

      #root_url  "admin_path"
    end

    def after_sign_out_path_for(resource)
      case resource
      when :admin
        new_admin_session_path
      when :customer
        root_path
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :customer_address, :telephone_number, :password, :is_deleted])
  end
end
