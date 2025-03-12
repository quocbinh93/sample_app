class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reactable, polymorphic: true, null: false
      t.string :reaction_type, null: false

      t.timestamps
    end

    add_index :reactions, [:user_id, :reactable_type, :reactable_id], unique: true, name: 'index_reactions_uniqueness'
  end
end
