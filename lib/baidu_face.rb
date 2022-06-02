class BaiDuFace

  #{"error_code"=>0, "error_msg"=>"SUCCESS", "log_id"=>563734290, "timestamp"=>1653545363, "cached"=>0, "result"=>{"face_token"=>"3369e2d959c1caa57df976eb0b6f0e3a", "location"=>{"left"=>2034.32, "top"=>1157.2, "width"=>165, "height"=>157, "rotation"=>0}}}
  def add_face_entity(id)
    @worker = Worker.find(id)
    url = 'https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add'
    file = @worker.avatar_base
    params = {
      image: file,
      image_type: 'BASE64',
      user_id: @worker.number,
      user_info: @worker.name,
      group_id: Setting.systems.face_group,
    }
    body = baidu_request(url, params)
    puts body
  end

  def get_face_entity(id)
  end

  def update_face_entity
  end

  def list_face_entities
  end

  def add_faces(id)
    @worker = Worker.find(id)
    url = 'https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add'
    @worker.img.split(',').each do |img|
      image = File.join(Rails.root, 'public', img)
      file = image_to_base64(image)
      params = {
        image: file,
        image_type: 'BASE64',
        user_id: @worker.number,
        user_info: @worker.name,
        group_id: Setting.systems.face_group,
      }
      body = baidu_request(url, params)
      puts body
      sleep(3)
    end
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
