class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :name
      t.integer :project_id
      t.integer :securityclass_id
      t.string :securitydtl
      t.integer :ifpass
      t.time :time
      t.integer :user_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
