class ApplicationController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate!

  def authenticate!
    logged_in?
  end

  def user_hash(user)
    {
      user_id: @user.id,
      username: @user.username,
      token: token_for_user(@user) 
    }
  end

  def token_for_user(user)
    JWT.encode({ user_id: user.id }, jwt_secret_key)
  end

  #authentication
  def logged_in?
    !!current_user_id
  end

  #authorization
  def current_user_id
    unless @current_user_id
      token = try_decode_token
      if token
        @current_user_id = token[0]["user_id"]
      else
        nil
      end
    end
    @current_user_id
  end

  private
  def try_decode_token
    decoded = nil

    authenticate_or_request_with_http_token do |token, options|

      begin
        decoded = JWT.decode(token, jwt_secret_key)
      rescue JWT::DecodeError => e
        return nil
      end

    end

    return decoded
  end
 
  def jwt_secret_key
    ENV["JWT_SECRET_KEY"]
  end
end
