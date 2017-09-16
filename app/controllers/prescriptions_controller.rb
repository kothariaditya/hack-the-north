class PrescriptionsController < ApplicationController
  def read_one
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    @prescription = @record.prescriptions.find(params[:id])
    render json: @prescription
  end

  def read_all
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    @prescription = @record.prescriptions.all
    render json: @prescription
  end

  def create
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    @prescription = @record.prescriptions.create(description: params[:description], brand_name: params[:brand_name], drug_name: params[:drug_name], notes: params[:notes])
    if @prescription.save
      render json: @prescription
    else
      return 500
    end
  end

  def update
    @user = User.find(params[:user_id])
    @record = @user.Records.find(params[:record_id])
    @prescription = @record.prescriptions.find(params[:id])
    if @prescription.update(prescription_params)
      render json: @prescription
    else
      return 500
    end
  end

  def prescription_params
    params.permit(:description, :brand_name, :drug_name, :notes)
  end
end
