class InspectorsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource 


  def index
    @factory = my_factory
    if current_user.has_role?(Setting.roles.role_grp)
      @inspectors = WxUser.all
    else
      @inspectors = @factory.wx_users
    end
  end

  def receive 
    @factory = my_factory
    @wxuser = @factory.wx_users.find(iddecode(params[:id]))
    #@wxuser = WxUser.find(iddecode(params[:id]))
    @wxuser.completed
    redirect_to :action => :index
  end

  def reject 
    @factory = my_factory
    @wxuser = @factory.wx_users.find(iddecode(params[:id]))
    #@wxuser = WxUser.find(iddecode(params[:id]))
    @wxuser.ongoing
    redirect_to :action => :index
  end
end
