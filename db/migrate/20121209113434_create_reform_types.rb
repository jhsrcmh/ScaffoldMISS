class CreateReformTypes < ActiveRecord::Migration
  def change
    create_table :reform_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
