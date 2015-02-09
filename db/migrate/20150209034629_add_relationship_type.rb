class AddRelationshipType < ActiveRecord::Migration
  def change
  	add_column :relationships, :is_expert?, :boolean
  end
end
