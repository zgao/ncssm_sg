class Upload
  def self.upload(obj, paperclip_file)
    file_path = paperclip_file.url
    file = drive.files.insert.request_schema.new {
      'title' => obj.title,
      'description' => obj.description,
      'mimeType' => nil
    }
  end
end
