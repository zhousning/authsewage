require 'aliyunsdkcore'


class FaceWorker
  #include Sidekiq::Worker

  def add_face_entity(id)
    @worker = Worker.find(id)
    client = aliyun_client
    flag = false
    
    response = client.request(
      action: 'AddFaceEntity',
      params: {
        "DbName":  Setting.systems.gdname,
        "EntityId": @worker.number, 
        "Labels": @worker.number + ',' + @worker.name
      },
      opts: {
        method: 'POST',
        format_params: true
      }
    )
    if response["RequestId"]
      flag = true
    end
    flag
  end

  def get_face_entity(id)
    @worker = Worker.find(id)
    client = aliyun_client
    face = ''
    
    response = client.request(
      action: 'GetFaceEntity',
      params: {
        "DbName":  Setting.systems.gdname,
        "EntityId": @worker.number, 
      },
      opts: {
        method: 'POST',
        format_params: true
      }
    )
    if response["RequestId"]
      faces = response['Data']['Faces']
      faces.each do |f|
        face += f['FaceId'] + ','
      end
    end
    face
  end

  def update_face_entity
  end

  def list_face_entities
  end

  def add_face
  end

  def search_face
  end

  private
    def aliyun_client
      client = RPCClient.new(
        access_key_id: ENV['ACCESS_KEY'],
        access_key_secret: ENV['ACCESS_KEY_SECRET'],
        endpoint: 'https://facebody.cn-shanghai.aliyuncs.com',
        api_version: '2019-12-30'
      )
      client
    end
end
