class UsersController < ApplicationController

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
    User.find_by_id(params[:id]).as_json
  end

  def list()
    users = User.all.map do |user|
      user.id
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
