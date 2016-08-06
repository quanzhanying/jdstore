# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick #使用minimagick处理压缩图片，确保安装magickimage这个东东，ubuntu可以sudo apt-get install magickimage

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir  #定义上传到哪个文件夹下
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url  #可以定义默认图片，如过用户没有上传图片，则可以使用默认的图片
    "avatar/#{version_name}.png"
  end


#图片的处理，有不同版本大小，网站可以在不同的地方调用不同的图片大小
 version :normal do
    process :resize_to_fill => [200, 200]
  end

  version :small do
    process :resize_to_fill => [200, 200]
  end

  version :large do
    process :resize_to_fill => [400, 400]
  end

  version :big do
    process :resize_to_fill => [800, 800]
  end

  version :index do
    process :resize_to_fill => [700, 438]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
#指定上传文件的格式
  def extension_white_list
    %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
