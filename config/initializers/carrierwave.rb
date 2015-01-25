CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id  =>  ENV['AWS2_ENV'], 
    :aws_secret_access_key  => ENV['AWS2_SECRET_ENV'], 
    :region                 => 'ap-northeast-1'
  }

if Rails.env.development?
config.fog_directory = 'mood2travel-develop' 
else
config.fog_directory = 'mood2travel' 
config.cache_dir = "#{Rails.root}/tmp/uploads" #for Heroku
end

end