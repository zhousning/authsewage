class FctWorker < ActiveRecord::Base
  belongs_to :factory
  belongs_to :worker
end
