class WorkersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  def index
    @worker = Worker.new
   
    @workers = Worker.all.page( params[:page]).per( Setting.systems.per_page )
   
  end
   

  def query_all 
    items = Worker.all
   
    obj = []
    items.each do |item|
      obj << {
        #:factory => idencode(factory.id),
        :id => idencode(item.id),
       
        :name => item.name,
       
        :idno => item.idno,
       
        :phone => item.phone,
       
        :gender => item.gender,
       
        :state => item.state,
       
        :adress => item.adress,
       
        :desc => item.desc
      
      }
    end
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end



   
  def show
   
    @worker = Worker.find(iddecode(params[:id]))
   
  end
   

   
  def new
    @worker = Worker.new
    
  end
   

   
  def create
    @worker = Worker.new(worker_params)
     
    if @worker.save
      unless @worker.avatar.file.nil?
        image = File.join(Rails.root, 'public', @worker.avatar_url)
        image_base64 = Base64.encode64(File.read(image)).gsub(/\s/, '')
        @worker.update_attributes!(:avatar_base => image_base64)
      end

      redirect_to :action => :index
    else
      render :new
    end
  end
   

   
  def edit
   
    @worker = Worker.find(iddecode(params[:id]))
   
  end
   

   
  def update
   
    @worker = Worker.find(iddecode(params[:id]))
   
    if @worker.update(worker_params)
      unless @worker.avatar.file.nil?
        image = File.join(Rails.root, 'public', @worker.avatar_url)
        image_base64 = Base64.encode64(File.read(image)).gsub(/\s/, '')
        @worker.update_attributes!(:avatar_base => image_base64)
      end
      redirect_to edit_worker_path(idencode(@worker.id)) 
    else
      render :edit
    end
  end
   

   
  def destroy
   
    @worker = Worker.find(iddecode(params[:id]))
   
    @worker.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def worker_params
      params.require(:worker).permit( :name, :idno, :phone, :gender, :state, :adress, :desc , :avatar , :idfront , :idback)
    end
  
  
  
end

