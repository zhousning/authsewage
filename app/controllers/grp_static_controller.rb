class GrpStaticController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource
  
  def query_device
    @devices = Device.select('mdno').uniq
    result = []
    @devices.each do |device|
      result << {
        id: device.mdno,
        text: device.mdno
      }
    end
    obj = {
      "results": result
    }
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end
   
  def query_by_area
    puts params
    _start = params[:start].gsub(/\s/, '')
    fct = params[:fct].gsub(/\s/, '')

    select_str = "distinct worker_id, sign_date, unit, name"
    sign_logs = SignLog.joins('LEFT JOIN devices ON sign_logs.device_id = devices.id').where(['devices.mdno = ? and sign_date = ?', fct, _start]).select(select_str)

    hash = Hash.new
    sign_logs.each do |sign_log|
      hash[sign_log.unit] = Hash.new if hash[sign_log.unit].nil?
      if hash[sign_log.unit][sign_log.name].nil?
        hash[sign_log.unit][sign_log.name] = 1 
      else
        hash[sign_log.unit][sign_log.name] += 1 
      end
    end

    respond_to do |f|
      f.json{ render :json => hash.to_json}
    end
  end
end
