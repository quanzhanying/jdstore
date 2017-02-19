CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJZD5VZ27EIIFFRPQ',

      aws_secret_access_key: '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',

      region:                'ap-northeast-1'

    }
    config.fog_directory  =  'fullstackxu'


  else
    config.storage :file
  end
end
