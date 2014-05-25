# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|

  if Rails.env.production?
    config.paperclip_defaults = {
          :storage => :s3,
          :bucket => ENV['S3_BUCKET_NAME'],
          :s3_credentials => {
              :access_key_id => ENV['AWS_ACCESS_KEY'],
              :secret_access_key => ENV['AWS_SECRET_KEY']
          }
      }
  end
end

Spree::Config[:max_level_in_taxons_menu] = 2
Spree.user_class = "Spree::LegacyUser"
