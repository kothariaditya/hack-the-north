class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_user_parameters, if: :devise_controller?

  protected

  def configure_user_parameters()
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :first_name,
      :last_name,
      :gender,
      :address,
      :country,
      :city,
      :birthday,
      :blood_type,
      :allergies,
      :major_diagnostics,
      :notes
    ])
  end
end
