class RecordsController < ApplicationController
  def read_one
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    render json: @record
  end

  def read_all
    @user = User.find(params[:user_id])
    @record = @user.Records.all
    render json: @record
  end

  def create
    @user = User.find(params[:user_id])
    @record = @user.Records.create(diagnosis: params[:diagnosis], symptoms: params[:symptoms])
    if @record.save
      render json: @record
    else
      return 500
    end
  end

  def update
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    if @record.update(record_params)
      render json: @record
    else
      return 500
    end
  end

  def record_params
    params.permit(:diagnosis, :symptoms)
  end
end
