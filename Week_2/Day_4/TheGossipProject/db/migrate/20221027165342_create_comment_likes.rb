class CreateCommentLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true

      t.timestamps
    end
  end
end
