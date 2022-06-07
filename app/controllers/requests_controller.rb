# frozen_string_literal: true
class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_client!
  before_action :set_request, only: [:show]
  def index
    @requests = Request.where(client_id: current_user.client)
  end

  def show
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.client = current_user.client
    @request.store = Product.find(@request.product_id).stores.order(priority: :desc).first

    if @request.save
      redirect_to @request, notice: 'Request was successfully created!.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def user_client!
    redirect_to root_path unless current_user.client?
  end

  def request_params
    params.require(:request).permit(:description, :product_id)
  end
end
