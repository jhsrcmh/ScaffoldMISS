class Worklog < ActiveRecord::Base
  attr_accessible :logdoc, :place, :project_id, :remarkinf, :time, :user_id
end
