class GrpDevicesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource
   
  def index
  end

  def query_all 
    items = Device.all
   
    obj = []
    items.each do |item|
      obj << {
        :id => idencode(item.id),
        :idno => item.idno,
        :name => item.name,
        :mdno => item.mdno,
        :unit => item.unit,
        :state => item.state,
        :pos => item.pos,
        :supplier => item.supplier,
        :pos_no => item.pos_no,
        :fct => item.factory.name
      }
    end
    obj
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end
   
  
end
