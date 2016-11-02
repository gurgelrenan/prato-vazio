class CreateCongressmen < ActiveRecord::Migration[5.0]
  def change
    create_table :congressmen do |t|
      t.string :name
      t.string :congressperson_id
      t.string :state
      t.string :party

      t.timestamps
    end
  end
end
