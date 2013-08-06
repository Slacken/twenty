# encoding:utf-8
class SessionsController < ApplicationController
  skip_before_filter :authorize, :only=>[:create,:new]
  def new
    only_for_unlogined
  end

  def create
    only_for_unlogined
    u = params[:user]
    if user = User.authenticate(u[:email],u[:password])
      self.current_user = user
      save_state
      redirect_to root_url
    else
      redirect_to signin_url, :alert=>"电子邮箱或者密码错误。"
    end
  end

  def destroy
    clear_state
  end
end
