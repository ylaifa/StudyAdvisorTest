class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.errors.full_messages
    if @message.save
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def destoy
    @message = Message.find(params[:id])
    @message.destoy
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:author, :content, :is_french)
  end
end
