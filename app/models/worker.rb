class Worker < ActiveRecord::Base

  mount_uploader :avatar, EnclosureUploader

  mount_uploader :idfront, EnclosureUploader

  mount_uploader :idback, EnclosureUploader


  has_many :fct_workers, :dependent => :destroy
  has_many :factories, :through => :fct_workers

  has_many :device_workers, :dependent => :destroy
  has_many :devices, :through => :device_workers

  has_many :sign_logs, :dependent => :destroy

  before_save :store_unique_number
  def store_unique_number
    if self.number == ""
      self.number = Time.now.to_i.to_s + "%04d" % [rand(10000)]
    end
  end

 STATESTR = %w(ongoing completed)
  STATE = [Setting.states.ongoing, Setting.states.completed]
  validates_inclusion_of :state, :in => STATE
  state_hash = {
    STATESTR[0] => Setting.states.ongoing, 
    STATESTR[5] => Setting.states.completed
  }

  STATESTR.each do |state|
    define_method "#{state}?" do
      self.state == state_hash[state]
    end
  end

  def ongoing 
    update_attribute :state, Setting.states.ongoing
  end

  def completed
    update_attribute :state, Setting.states.completed
  end

end
