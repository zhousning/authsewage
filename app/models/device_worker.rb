class DeviceWorker < ActiveRecord::Base
  belongs_to :device
  belongs_to :worker
end
