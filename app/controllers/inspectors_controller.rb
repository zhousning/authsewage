class InspectorsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  authorize_resource 


  def index
    #@factory = my_factory
    @inspectors = WxUser.all
  end

  def receive 
    #@factory = my_factory
    @wxuser = WxUser.find(iddecode(params[:id]))
    @wxuser.completed
    redirect_to :action => :index
  end

  def reject 
    #@factory = my_factory
    #@wxuser = @factory.wx_users.find(iddecode(params[:id]))
    @wxuser = WxUser.find(iddecode(params[:id]))
    @wxuser.ongoing
    redirect_to :action => :index
  end
end
