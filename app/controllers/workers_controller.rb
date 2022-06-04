class WorkersController < ApplicationController
  include BaiduFace
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  def index
    @workers = Worker.all.page( params[:page]).per( Setting.systems.per_page )
   
  end
   
  def receive 
    @worker = Worker.find(iddecode(params[:id]))
    @worker.processing
    BaiduFaceWorker.perform_async(@worker.id)
    redirect_to :action => :index
  end

  def reject 
    @worker = Worker.find(iddecode(params[:id]))
    @worker.ongoing
    redirect_to :action => :index
  end

   
  def show
   
    @worker = Worker.find(iddecode(params[:id]))
   
  end
   
  def destroy
   
    @worker = Worker.find(iddecode(params[:id]))
    idno = @worker.number
    body = delete_user(idno)
    if body['error_code'] == 0
      @worker.destroy
    end
    redirect_to :action => :index
  end
   

  

   
  #def new
  #  @worker = Worker.new
  #  
  #end
  # 

  # 
  #def create
  #  @worker = Worker.new(worker_params)
  #  face_worker = BaiDuFace.new
  #   
  #  if @worker.save
  #    unless @worker.avatar.file.nil?
  #      image = File.join(Rails.root, 'public', @worker.avatar_url)
  #      image_base64 = Base64.encode64(File.read(image)).gsub(/\s/, '')
  #      @worker.update_attributes!(:avatar_base => image_base64)

  #      face_worker.add_face_entity(@worker.id)
  #    end

  #    redirect_to :action => :index
  #  else
  #    render :new
  #  end
  #end
  # 

  # 
  #def edit
  # 
  #  @worker = Worker.find(iddecode(params[:id]))
  # 
  #end
  # 

  # 
  #def update
  # 
  #  @worker = Worker.find(iddecode(params[:id]))
  # 
  #  if @worker.update(worker_params)
  #    unless @worker.avatar.file.nil?
  #      image = File.join(Rails.root, 'public', @worker.avatar_url)
  #      image_base64 = Base64.encode64(File.read(image)).gsub(/\s/, '')
  #      @worker.update_attributes!(:avatar_base => image_base64)
  #    end
  #    redirect_to edit_worker_path(idencode(@worker.id)) 
  #  else
  #    render :edit
  #  end
  #end
   

   

  

  
  
  

  private
    def worker_params
      params.require(:worker).permit( :name, :idno, :phone, :gender, :state, :adress, :desc , :avatar , :idfront , :idback)
    end
  
  
  
end

