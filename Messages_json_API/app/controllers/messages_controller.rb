class MessagesController < ApplicationController
  def create
    new_message = Message.create(message_params)
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
      params.permit(:id, :threadID,:labelIds,:snippet, :historyId, :internalDate, :payload, :sizeEstimate)
  end

end
