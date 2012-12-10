class CreateSecurityProjTypes < ActiveRecord::Migration
  def change
    create_table :security_proj_types do |t|
      t.string :securityprojtypename
      t.string :priority
      t.text :remarkinf

      t.timestamps
    end
  end
end
