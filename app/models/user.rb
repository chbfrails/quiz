class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    # Create user if new?
    user = User.prepare_user(data) unless user
    user.token = access_token['credentials']['token']
    user.save
    user
  end

  def self.prepare_user(data)
    User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
  end
end
