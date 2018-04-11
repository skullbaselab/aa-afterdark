class Api::SessionsController < ApplicationController

  before_action :ensure_logged_in, only: [:destroy]
  #before_action :ensure_logged_out, except: [:destroy]

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login(@user)
      render 'api/users/show'
    else
      render json: {errors: ["Invalid credentials"]}, status: 403
    end
  end

  def destroy
    logout
    render json: {}
  end

end
