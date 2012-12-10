class EverydayCheck < ActiveRecord::Base
  attr_accessible :checktime, :everydaycheck_id, :everydaycheckform, :project_id, :remarkinf, :user_id, :file_path
end
