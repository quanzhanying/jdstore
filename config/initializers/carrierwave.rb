require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    if Rails.env.production?
        config.storage :fog
        config.fog_credentials = {
            provider:              'AWS',
            aws_access_key_id:     ENV['AKIAI7MAV6NQ74C7B5FQ'], # 你的 key

            aws_secret_access_key: ENV['zuf5RiI7EWySDrFztajJfCuuki9hy5oY38w7MjsE'], # 你的 secret key

            region:                'ap-northeast-1' # 你的 S3 bucket 的 Region 位置

        }
        config.fog_directory = ENV['fullstack-love-and-gift'] # 你设定的 bucket name

    else
        config.storage :file
    end
end
