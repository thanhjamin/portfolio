class AddRemarkableToRemarks < ActiveRecord::Migration
 def up
    add_column :remarks, :remarkable_id, :integer
    add_column :remarks, :remarkable_type, :string
    # add_index :remarks, [:remarkable_id, :commentable_type]
    # ideally, loop through all post ids and stick them into
    # remarkable_id, type: 'post'
    remove_column :remarks, :comment_id
  end

  def down
    remove_column :remarks, :remarkable_id
    remove_column :remarks, :remarkable_type
    # remove_index :remarks, [:remarkable_id, :commentable_type]
    # ideally change all post type remarks back to comment_id's
    add_column :remarks, :comment_id, :integer
  end
end
