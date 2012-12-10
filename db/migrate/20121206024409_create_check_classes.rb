class CreateCheckClasses < ActiveRecord::Migration
  def change
    create_table :check_classes do |t|
      t.string :checkclassname
      t.integer :priority
      t.text :remarkinf

      t.timestamps
    end
  end
end
