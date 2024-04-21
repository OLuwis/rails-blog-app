class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def change_locale
    if I18n.available_locales.include?(params[:locale].to_sym)
      cookies[:locale] = { value: params[:locale], expires: 1.year.from_now }
    end

    redirect_back(fallback_location: root_path)
  end

  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname])
    end
end
