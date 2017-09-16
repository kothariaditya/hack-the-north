class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      return 200
    else
      return 405
    end
  end

  def destroy
    session.delete(:user_id)
    return 200
  end
end
