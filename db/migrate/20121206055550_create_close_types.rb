class CreateCloseTypes < ActiveRecord::Migration
  def change
    create_table :close_types do |t|
      t.string :closetypename
      t.integer :priority
      t.text :remarkinf

      t.timestamps
    end
  end
end
