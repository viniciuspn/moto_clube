class ChangeMotorcyclesUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :motorcycles, :id_user
  	add_column :motorcycles, :user_id, :integer
  end
end
