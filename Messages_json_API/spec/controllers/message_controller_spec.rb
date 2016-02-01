require 'rails_helper'

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
      params = TEST_MESSAGE
      message = Message.create(params)
      get "show", {message_id: message.message_id}
      expect(response.status).to eq(200)
    end
  end

end

