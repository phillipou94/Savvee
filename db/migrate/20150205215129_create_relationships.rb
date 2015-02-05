class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps null: false
    end
    add_index :relationships, :user_id
    add_index :relationships, :topic_id
    add_index :relationships, [:user_id, :topic_id], unique: true
  end
end
