class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|

      t.timestamps
    end
  end
end
