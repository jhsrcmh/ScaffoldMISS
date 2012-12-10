class Security < ActiveRecord::Base
  attr_accessible :ifpass, :name, :project_id, :remarkinf, :securityclass_id, :securitydtl, :time, :user_id, :file_path
end
