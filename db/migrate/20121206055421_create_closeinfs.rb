class CreateCloseinfs < ActiveRecord::Migration
  def change
    create_table :closeinfs do |t|
      t.string :name
      t.string :Closeinf
      t.integer :project_id
      t.string :closedtl
      t.datetime :closetime
      t.integer :user_id
      t.integer :closeinf_type_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
