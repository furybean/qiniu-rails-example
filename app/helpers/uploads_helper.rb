module UploadsHelper
  def download_path(upload)
    if upload.file_key
      url = Qiniu::RS.download(QiniuRailsExample::Application::QINIU_BUCKET, upload.file_key)
      return url if url
    end
    return ""
  end

  def download_url(upload)
    return "/uploads/#{upload.id}/download" if upload
  end

  GIGA_SIZE = 1073741824.0
  MEGA_SIZE = 1048576.0
  KILO_SIZE = 1024.0

  # Return the file size with a readable style.
  def readable_file_size(size, precision)
    case
      when size == 1 
        "1 Byte"
      when size < KILO_SIZE 
        "%d Bytes" % size
      when size < MEGA_SIZE 
        "%.#{precision}f KB" % (size / KILO_SIZE)
      when size < GIGA_SIZE 
        "%.#{precision}f MB" % (size / MEGA_SIZE)
      else 
        "%.#{precision}f GB" % (size / GIGA_SIZE)
    end
  end

end
