class SignLogsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  def index
    @sign_log = SignLog.new
   
    #@sign_logs = SignLog.all.page( params[:page]).per( Setting.systems.per_page )
   
  end
   

  def query_all 
    items = SignLog.all
   
    obj = []
    items.each do |item|
      obj << {
        #:factory => idencode(factory.id),
        :id => idencode(item.id),
       
        :sign_date => item.sign_date,
       
        :wx_user_id => item.wx_user_id,
       
        :device_id => item.device_id
      
      }
    end
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end



   
  def show
   
    @sign_log = SignLog.find(iddecode(params[:id]))
   
  end
   

   
  def new
    @sign_log = SignLog.new
    
  end
   

   
  def create
    @sign_log = SignLog.new(sign_log_params)
     
    if @sign_log.save
      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @sign_log = SignLog.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @sign_log = SignLog.find(iddecode(params[:id]))
   
    if @sign_log.update(sign_log_params)
      redirect_to sign_log_path(idencode(@sign_log.id)) 
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @sign_log = SignLog.find(iddecode(params[:id]))
   
    @sign_log.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def sign_log_params
      params.require(:sign_log).permit( :sign_date, :wx_user_id, :device_id , :avatar)
    end
  
  
  
end

