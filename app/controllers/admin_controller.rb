# frozen_string_literal: true
class AdminController < ApplicationController
  def index
    @requests = current_user.store.requests.order(:state)
  end

  def show_request
    @request = Request.find(params[:id])
  end

  def accept_request
    @request = Request.find(params[:id])
  end

  def assign_price
    @request = Request.find(params[:id])
    @request.price = request_params[:precio]
    @request.state = 'Accepted'
    @request.save
    redirect_to admin_index_path(@request)
  end

  def dismiss_request
    @request = Request.find(params[:id])
    @request.state = 'Refused'
    @request.save
    DiscardRequestMailer.discard_send_email(@request.client.user).deliver_now
    redirect_to admin_index_path(@request)
  end

  private
  def request_params
    params.require(:request).permit(:price)
  end
end
