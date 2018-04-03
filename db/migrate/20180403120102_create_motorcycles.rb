class CreateMotorcycles < ActiveRecord::Migration[5.1]
  def change
    create_table :motorcycles do |t|
      t.string :model
      t.string :manufacturer
      t.string :id_user
      t.string :cylinder
      t.string :board

      t.timestamps
    end
  end
end
