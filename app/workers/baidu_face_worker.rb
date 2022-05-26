class BaiDuFaceWorker
  include Sidekiq::Worker

  def add_face_entity(id)
    @worker = Worker.find(id)
    url = 'https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add'
    file = @worker.avatar_base
    params = {
      image: file,
      image_type: 'BASE64',
      user_id: @worker.number,
      user_info: @worker.name,
      group_id_list: Setting.systems.face_group,
    }
    body = baidu_request(url, params, file)
    puts body
  end

  def get_face_entity(id)
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
    def image_to_base64(photo)
      tempfile = open(photo)
      image_base64 = Base64.encode64(File.read(tempfile)).gsub(/\s/, '')
      tempfile.close
      image_base64
    end

    def baidu_request(url, params)
      url = url + "?access_token=" + ENV['ACCESS_TOKEN']
      body = nil
      RestClient.post(url, params, {content_type: "application/json;charset=UTF-8"}) do |response|
        body = JSON.parse(response.body)
      end
      body
    end

end
