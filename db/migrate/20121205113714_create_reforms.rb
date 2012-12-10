class CreateReforms < ActiveRecord::Migration
  def change
    create_table :reforms do |t|
      t.integer :project_id
      t.string :reformdoc
      t.string :reformmark
      t.string :reformresponse
      t.integer :reformtype
      t.integer :user_id
      t.text :remarkinf

      t.timestamps
    end
  end
end
