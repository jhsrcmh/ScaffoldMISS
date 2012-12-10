class SecurityProj < ActiveRecord::Base
  attr_accessible :detail, :ifpass, :name, :project_id, :remarkinf, :security_proj_type_id, :user_id, :file_path
end
