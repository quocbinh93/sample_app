class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true
      t.references :parent_comment, null: true, foreign_key: { to_table: :comments }

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:micropost_id, :created_at]
  end
end
