# app/controllers/concerns/token_authenticatable.rb
module TokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_token!
  end

  def authenticate_token!
    token = request.headers["Authorization"]&.split("Bearer ")&.last
    head :unauthorized unless ApiClient.exists?(token: token)
  end
end
