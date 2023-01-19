class CreateJoinTableMessageRecipients < ActiveRecord::Migration[7.0]
  def change
    create_table :join_table_message_recipients do |t|
      t.belongs_to :private_message, index: true
      t.belongs_to :recipient, index: true
      
      t.timestamps
    end
  end
end