class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
  # before_actionでdeviseのストロングパラメーターにnameカラムを追加するメソッドを実行。
  before_action :configure_permitted_parameters, if: :devise_controller?

  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
end
