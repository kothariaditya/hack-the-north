class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:list, :update]

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      return 200
    else
      return 500
    end
  end

  def read()
    user = User.find(params[:id])
    render json: user.as_json
  end

  def qrcode()
    user = User.find(params[:id])
    user_basic_info = user.as_json(only: [
      :first_name,
      :last_name,
      :birthday,
      :blood_type,
      :allergies,
      :major_diagnostics
    ])
    user_basic_info[:id] = user.hashid
    user_basic_info[:url] = user_info_url(user.hashid)
    qrcode = RQRCode::QRCode.new(user_basic_info.to_s)
    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 512,
      border_modules: 4,
      module_px_size: 6
    )
    send_data png, type: 'image/png', disposition: 'inline'
  end

  def info()
    @user = User.find(params[:id])
  end

  def list()
    users = User.all.map do |user|
      user.hashid
    end

    render json: users
  end

  def update()
    User.update(params[:id], user_params)
  end

  def user_params()
    params.permit(
      :email,
      :password,
      :password_confirmation,
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
    )
  end
end
