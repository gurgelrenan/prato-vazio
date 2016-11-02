class CreateDeputies < ActiveRecord::Migration[5.0]
  def change
    create_table :deputies do |t|
      t.string :congressperson_id
      t.string :congressperson_name
      t.string :state
      t.string :party

      t.timestamps
    end
  end
end
