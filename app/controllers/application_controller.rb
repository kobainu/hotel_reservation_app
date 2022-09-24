class ApplicationController < ActionController::Base
  # ユーザーページにアクセス前に実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  private

  # サインアップ時にnameを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
