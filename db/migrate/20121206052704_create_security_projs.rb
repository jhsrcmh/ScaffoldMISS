class CreateSecurityProjs < ActiveRecord::Migration
  def change
    create_table :security_projs do |t|
      t.string :name
      t.integer :project_id
      t.string :detail
      t.integer :ifpass
      t.integer :user_id
      t.integer :security_proj_type_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
