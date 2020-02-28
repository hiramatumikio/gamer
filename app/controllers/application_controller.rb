class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      case resource
      when Public
        publics_articles_path
      when Admin
        admins_articles_path
      end
    end

    def after_sign_up_path_for(resource)
      case resource
      when Public
        publics_articles_path
      when Admin
        admins_articles_path
      end
    end

      protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nickname])
  end

  def authenticate_user

    if @current_user == nil

    redirect_to("/login")

    end
  end
end
