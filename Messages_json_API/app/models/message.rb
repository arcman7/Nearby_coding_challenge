class Message < ActiveRecord::Base
  validates_uniqueness_of :message_id
  validates_presence_of :message_id
end
