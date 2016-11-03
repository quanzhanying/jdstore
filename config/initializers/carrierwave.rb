# CarrierWave.configure do |config|
#   if Rails.env.production?
#     config.storage :aws
#     config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:    ENV["S3_key_id"],      # 你的 key
#
#
#       aws_secret_access_key: ENV["S3_key_secret"],      # 你的 secret key
#
#
#       region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置
#
#
#     }
#     config.fog_directory  = ENV["S3_bucket"]  # 你设定的 bucket name



CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage    =  :aws                  # required
    config.aws_bucket =  ENV['S3_bucket']      # required
    config.aws_acl    =  :public_read

    config.aws_credentials = {
      access_key_id:      ENV['S3_key_id'],       # required
      secret_access_key:  ENV['S3_key_secret']     # required
    }

  config.aws_attributes = {
                            'Cache-Control'=>"max-age=#{365.day.to_i}",
                            'Expires'=>'Tue, 29 Dec 2015 23:23:23 GMT'
                          }

  else
    config.storage :file
  end
end
