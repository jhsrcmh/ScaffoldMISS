class CreateEverydaycheckTypes < ActiveRecord::Migration
  def change
    create_table :everydaycheck_types do |t|
      t.string :everydaychecktype
      t.integer :priority
      t.text :remarkinf

      t.timestamps
    end
  end
end
