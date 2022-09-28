class ApplicationController < ActionController::Base
  # ユーザーページにアクセス前に実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q

  private
  
  # サインアップ時にnameを許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
