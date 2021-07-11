# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_message, only: [:show]

  def index
    @messages = current_user.recieved_messages.order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @users = User.where.not(id: current_user.id).pluck(:name, :id)
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    if message.save
      flash[:info] = 'message send successfully'
    else
      flash[:error] = 'something went wrong'
    end
    redirect_to root_path
  end

  def show; end

  def unread_messages
    count = current_user.unread_messages.count
    render json: { count: count }
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :reciever_id).merge(sender_id: current_user.id)
  end

  def set_message
    @message = Message.find_by(id: params[:id], reciever_id: current_user.id)
    if @message.nil?
      flash[:info] = 'message not found'
      redirect_to(root_path)
    else
      @message.update(read_at: Time.now) if @message.read_at.nil?
    end
  end
end
