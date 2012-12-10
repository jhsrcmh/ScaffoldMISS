class CreateSecurityClasses < ActiveRecord::Migration
  def change
    create_table :security_classes do |t|
      t.string :securityclassname
      t.integer :securityclassgrade
      t.string :securityfathername
      t.text :remarkinf

      t.timestamps
    end
  end
end
