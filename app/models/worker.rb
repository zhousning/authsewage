class Worker < ActiveRecord::Base

  mount_uploader :avatar, EnclosureUploader

  mount_uploader :idfront, EnclosureUploader

  mount_uploader :idback, EnclosureUploader


  has_many :fct_workers, :dependent => :destroy
  has_many :factories, :through => :fct_workers

  has_many :device_workers, :dependent => :destroy
  has_many :devices, :through => :device_workers




end
