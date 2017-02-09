CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    config.cache_dir      = Rails.root.join('tmp', 'uploads')
end
