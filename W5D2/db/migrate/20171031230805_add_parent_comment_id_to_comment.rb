class AddParentCommentIdToComment < ActiveRecord::Migration[5.1]
  def change

    add_column :comments, :comment_parent_id, :integer
  end
end
