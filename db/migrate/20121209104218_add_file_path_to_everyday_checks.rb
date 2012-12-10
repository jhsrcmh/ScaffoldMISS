class AddFilePathToEverydayChecks < ActiveRecord::Migration
  def change
    add_column :everyday_checks, :file_path, :string
  end
end
