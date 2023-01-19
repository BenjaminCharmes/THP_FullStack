class CreateGossipLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :gossip_likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gossip, index: true

      t.timestamps
    end
  end
end
