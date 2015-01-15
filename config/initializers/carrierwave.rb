CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAII6NSWAUEVCKZ5GA',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

if Rails.env.development?
config.fog_directory = 'mood2travel-develop' 
else
config.fog_directory = 'mood2travel' 
config.cache_storage = :fog #キャッシュの場所をS3に変更
config.cache_dir = "#{Rails.root}/tmp/uploads" #for Heroku
end

end