class MessagesController < ApplicationController
  include 'json'

  def create
    @new_message = Message.new(message_params)
    begin
      @new_message.save
    rescue ActiveRecord::RecordInvalid => e
      render error: e.record.errors.details, status: 404
    end
    render :nothing, status: 204
    # if @new_message.save
    #   render :nothing, status: 200
    # else
    #   render :nothing, status: 404
    # end
  end

  def show
    @message = Message.find_by(message_id: params[:id])
    render: @message.serial_string
  end

  private

  def message_params
  ##if we're saving the entire message object:
  serial_string = params.permit(:id, :threadID,:labelIds,:snippet, :historyId, :internalDate, :payload, :sizeEstimate).to_json
  id = params[:id]
  { serial_string: serial_string, message_id: id}
  ##if we're saving the payload object only:
  #params.require(:payload).permit(:mimeType, :filename, :headers, :body, :parts)
  end

end
