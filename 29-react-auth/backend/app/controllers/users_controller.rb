class UsersController < ApplicationController

  skip_before_action :authenticate!, only: :create

  def create

    @user = User.new

    @user.username = params[:username]
    @user.password = params[:password]

    if @user.save
      @user.snackify!
      render json: user_hash(@user)
    else
      render json: {
        errors: @user.errors.full_messages
      }
    end
  end

  def users_snacks
    if current_user_id && current_user_id.to_s == params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user
        render json: @user.snacks
      else
        render nothing: true, :status => :not_found
      end
    else #NOT AUTHORIZED
      render nothing: true, :status => :unauthorized
    end
  end

end
