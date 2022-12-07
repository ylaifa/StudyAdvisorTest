class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC")
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:author, :content, :is_french, :tag_id)
  end
end
