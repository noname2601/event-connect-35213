class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to introduction_path(@message.introduction)
    else
      @introduction = @message.introduction
      @messages = @introduction.messages
      render "introductions/show"
    end
  end

  

  private

  def message_params
    params.require(:message).permit(:text).merge( introduction_id: params[:introduction_id])
  end
end
