class Project < ActiveRecord::Base
  attr_accessible :ifon, :projinf, :projname, :remarkinf, :security_id, :time, :user_id
end
