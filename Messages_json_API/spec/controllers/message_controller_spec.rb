require 'rails_helper'
require 'json'

#MESSAGE_JSON =
RSpec.describe MessagesController, type: :controller do
  context "meta" do
    it "can run tests successfully" do
      expect(true).to eq(true)
    end
  end

  context "#create" do
    it "can save a new message" do
      params = TEST_MESSAGE
      expect{
       post "create", params
      }.to change{Message.count}
      expect(response.status).to eq(204)
      #expect(JSON.parse(response.body)["message"]).to_not eq(nil)
    end
  end

  context "#show" do
    it "can hit the route" do
      serial_string = TEST_MESSAGE.to_json
      message = Message.create(message_id: 77, serial_string: serial_string)
      get "show", {message_id: message.message_id}
      expect(response.status).to eq(200)
    end
  end

end

