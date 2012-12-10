class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :userpwd
      t.integer :role

      t.timestamps
    end
  end
end
