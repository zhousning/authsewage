require 'aliyunsdkcore'

class GdservicesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #authorize_resource

   
  def index
    client = RPCClient.new(
      access_key_id: ENV['ACCESS_KEY'],
      access_key_secret: ENV['ACCESS_KEY_SECRET'],
      endpoint: 'https://facebody.cn-shanghai.aliyuncs.com',
      api_version: '2019-12-30'
    )
    
    response = client.request(
      action: 'ListFaceDbs',
      params: {},
      opts: {
        method: 'POST',
        format_params: true
      }
    )

    obj = response
    if obj["RequestId"]
      obj['Data']['DbList'].each do |res|
        name = res['Name']
        sid = obj["RequestId"]
        gdservice = Gdservice.where(:name => name).first
        if gdservice.nil?
          Gdservice.create!(:name => name)
        end
      end
    end
    @gdservices = Gdservice.all
  end
   

  def query_all 
    items = Gdservice.all
   
    obj = []
    items.each do |item|
      obj << {
        #:factory => idencode(factory.id),
        :id => idencode(item.id),
       
        :key => item.key,
       
        :name => item.name,
       
        :sid => item.sid
      
      }
    end
    respond_to do |f|
      f.json{ render :json => obj.to_json}
    end
  end
   
  def show
   
    @gdservice = Gdservice.find(iddecode(params[:id]))
   
  end
   

   
  def new
    @gdservice = Gdservice.new
    
  end
   

   
  def create
    puts ENV['ACCESS_KEY']
    puts ENV['ACCESS_KEY_SECRET']
    client = RPCClient.new(
      access_key_id: ENV['ACCESS_KEY'],
      access_key_secret: ENV['ACCESS_KEY_SECRET'],
      endpoint: 'https://facebody.cn-shanghai.aliyuncs.com',
      api_version: '2019-12-30'
    )
    
    response = client.request(
      action: 'CreateFaceDb',
      params: {
        "Name": gdservice_params[:name]
    },
      opts: {
        method: 'POST',
        format_params: true
      }
    )

    obj = response
    if obj["RequestId"]
      sid = obj["RequestId"]
      @gdservice = Gdservice.new(format_params(gdservice_params, sid))
      if @gdservice.save
        redirect_to :action => :index
      else
        render :new
      end
    else
      @gdservice = Gdservice.new(gdservice_params)
      flash[:errmsg] = obj["errcode"].to_s + '  ' + obj['errmsg']
      render :new
    end
  end

  def format_params(old_params, sid)
    new_params = old_params
    new_params[:sid] = old_params[:sid]
    new_params
  end
   

   
  def destroy
   
    @gdservice = Gdservice.find(iddecode(params[:id]))
   
    @gdservice.destroy
    redirect_to :action => :index
  end
   

  

  

  
  
  

  private
    def gdservice_params
      params.require(:gdservice).permit( :key, :name, :sid)
    end
  
  
  
end
