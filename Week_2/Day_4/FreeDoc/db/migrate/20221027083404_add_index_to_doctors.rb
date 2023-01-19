class AddIndexToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_reference :doctors, :city, foreign_key: true
  end
end
