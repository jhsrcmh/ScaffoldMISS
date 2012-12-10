class Reform < ActiveRecord::Base
  attr_accessible :project_id, :reformdoc, :reformmark, :reformresponse, :reformtype, :remarkinf, :user_id, :file_path_a, :file_path_b
end
