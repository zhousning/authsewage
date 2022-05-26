require 'aliyunsdkcore'
require 'open-uri'

class WxAuthsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_filter :wxuser_exist?
  
  def image_to_base64(photo)
    tempfile = open(photo)
    image_base64 = Base64.encode64(File.read(tempfile)).gsub(/\s/, '')
    tempfile.close
    image_base64
  end

  def baidu_request(url, file)
    url = url + "?access_token=" + ENV['ACCESS_TOKEN']
    params = {
      image: image_to_base64(file),
      image_type: 'BASE64',
      group_id_list: Setting.systems.face_group,
    }

    body = nil
    RestClient.post(url, params, {content_type: "application/json"}) do |response|
      body = JSON.parse(response.body)
    end

    body
  end

  def auth_process
    url = "https://aip.baidubce.com/rest/2.0/face/v3/search"
    body = baidu_request(url, params[:photo])
    puts body

    respond_to do |f|
      f.json{ render :json => {:state => "success"}.to_json}
    end
    
  end

  def aliauth_process 
    worker = Worker.first
    imageA = worker.avatar_base
    imageB = image_to_base64(params[:photo])
    client = RPCClient.new(
      access_key_id:     ENV['ACCESS_KEY_ID'],
      access_key_secret: ENV['ACCESS_KEY_SECRET'],
      endpoint: 'https://facebody.cn-shanghai.aliyuncs.com',
      api_version: '2019-12-30'
    )
    
    response = client.request(
      action: 'CompareFace',
      params: {
        #"ImageURLA": "http://viapi-test.oss-cn-shanghai.aliyuncs.com/viapi-3.0domepic/facebody/CompareFace/CompareFace-right1.png",
        #"ImageURLB": "http://viapi-test.oss-cn-shanghai.aliyuncs.com/viapi-3.0domepic/facebody/CompareFace/CompareFace-left1.png"
        "ImageDataA": imageA,
        "ImageDataB": imageB,
      },
      opts: {
        method: 'POST',
        format_params: true
      }
    )
    
    puts response

    respond_to do |f|
      f.json{ render :json => {:state => "success"}.to_json}
    end
  end
end


