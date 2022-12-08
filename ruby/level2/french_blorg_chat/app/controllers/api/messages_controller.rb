class Api::MessagesController < ApplicationController
  def index
    @messages = Message.all 
    respond_to do |format|
      format.json { render json: @messages.to_json, status: :ok }
    end
  end

  def show
    @message = Message.find(params[:id])
    respond_to do |format|
      format.json { render json: @message.to_json, status: :ok }
    end
  end
end