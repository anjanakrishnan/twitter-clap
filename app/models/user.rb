class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  def twitter

    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = token
      config.access_token_secret = secret
    end
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil, hash)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      if hash.nil?
        user = User.create!(name:auth.extra.raw_info.name,
                              provider:auth.provider,
                              uid:auth.uid,
                              email:auth.uid+"@twitter.com",
                              password:Devise.friendly_token[0,20],
                              token: auth.credentials.token,
                              secret: auth.credentials.secret,
                              profile_image_url: auth.extra.raw_info.profile_image_url,
                            )
         
      else
        user = User.where(:id_hash => hash).update(name:auth.extra.raw_info.name,
                              provider:auth.provider,
                              uid:auth.uid,
                              password:Devise.friendly_token[0,20],
                              token: auth.credentials.token,
                              secret: auth.credentials.secret,
                              profile_image_url: auth.extra.raw_info.profile_image_url
                            )
        user = User.where(:uid => auth.uid).first
      end
    end
  end
end
