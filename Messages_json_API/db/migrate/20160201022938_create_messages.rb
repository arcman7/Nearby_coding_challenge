class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :message_id, index: true
      t.string :serial_string

      t.timestamps null: false
    end
  end
end
