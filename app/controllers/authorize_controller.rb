#encoding : utf-8

# 负责处理API认证
class AuthorizeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authorize
  skip_before_filter :not_api_access
  @@expires = 3600*24
  def entry
    @result = {:succeed=>false}
    act = params[:act]
    if params[:email].present? && params[:password].present?
      if act == 'register'
        @user = User.new({:email=>params[:email],:password=>params[:password],:password_confirmation=>params[:password]})
        @user.name = @user.email.split("@").first
        @user.token = Token.new({:count=>0,:value=>@user.new_token})
        if @user.save
          @result[:succeed] = true
          @result[:user_id] = @user.id
          @result[:token] = @user.token.value
          @result[:expires] = @@expires
        else
          @result[:error_info] = "Email有误或密码过短"
        end

      elsif act == 'login'
        @user = User.authenticate(params[:email],params[:password])
        if @user.nil?
          @result[:error_info] = "密码不正确"
        else
          if(Time.now - @user.token.updated_at > @@expires) # 过期
            @user.token.value = @user.new_token
            @user.save
            @result[:expires] = @@expires
          else
            @result[:expires] = @@expires + @user.token.updated_at - Time.now
          end
          @result[:user_id] = @user.id
          @result[:token] = @user.token.value
        end
        logger.debug(@result.to_yaml)
      else
        @result[:error_info] = "请求的内容不存在"
      end
    else
      @result[:error_info] = "请输入完整信息"
    end
    render :json => @result
  end

end
