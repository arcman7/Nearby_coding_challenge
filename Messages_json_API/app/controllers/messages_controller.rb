class MessagesController < ApplicationController
  require 'json'

  def create
    @new_message = Message.new(message_params)
    begin
      @new_message.save
    rescue ActiveRecord::RecordInvalid => e
      render error: e.record.errors.details, status: 400
    end
    render nothing: true, status: 204
  end

  def show
    @message = Message.find_by(message_id: params[:id])
    if @message
      render @message.serial_string, status: 200
    else
      render nothing: true, status: 404
    end
  end

  def test
    #testing rails syntax, I'm rusty :/
    render "hi",status: 200
  end

  private

  def message_params
    ##if we're saving the entire message object:
    serial_string = params.permit(:id, :threadId,:labelIds,:snippet, :historyId, :internalDate, :payload, :sizeEstimate).to_json
    id = params[:id]
    { serial_string: serial_string, message_id: id}
    ##if we're saving the payload object only:
    #params.require(:payload).permit(:mimeType, :filename, :headers, :body, :parts)
  end
end
