class CreateRemarks < ActiveRecord::Migration
  def change
    create_table :remarks do |t|
      t.string :author
      t.string :author_url
      t.string :author_email
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.text :content
      t.boolean :approved
      t.references :comment

      t.timestamps
    end
    add_index :remarks, :comment_id
  end
end
