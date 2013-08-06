# encoding: utf-8
require "base64"
class ApplicationController < ActionController::Base
  before_filter :authorize
  before_filter :not_api_access
  protect_from_forgery
  helper_method :logined?, :current_user,:user_id
  
  def initialize
    super
    @api_access = true
  end

  protected

    def authorize
      redirect_to signin_url,:notice => "请先登录。" unless logined?
    end
    # 普通请求而非API请求
    def not_api_access
      @api_access = false
    end

    def logined?
      user_id > 0
    end

    def only_for_unlogined
      if logined?
        redirect_to root_url
      end
    end

    def user_id
      session[:user_id] || 0
    end
    def current_user
      @current_user ||= (@api_access ? token_login : (session_login || cookie_login))
      # logger.debug(@current_user.to_yaml)
      @current_user
    end

    def current_user=(user)
      @current_user = user
    end

    def session_login
      if session[:user_id].present?
        begin
          User.find(session[:user_id])
        rescue
          session[:user_id] = nil
        end
      end
    end

    def cookie_login
      if cookies[:iremember].present?
        email,password = Base64.decode64(cookies[:iremember]).split("$")
        user = User.authenticate(email,password)
        if user = User.authenticate(email,password)
          session[:user_id] = user.id
          user
        else
          cookies.delete(:iremember)
          nil
        end
      end
    end

    def token_login
      if params[:token].present?
        if user = User.find_by_token_value(params[:token])
          user
        end
      end
    end

    def save_state
      session[:user_id] = @current_user.id
      user = params[:user] # 直接从参数里面保存
      cookies[:iremember] = {:value=>Base64.encode64([user["email"],user["password"]].join("$")),:expires=>Time.now+3600*24*365}
    end

    def clear_state
      session[:user_id] = nil
      cookies.delete(:iremember)
    end
end
