#encoding : utf-8

# 负责处理API请求
class ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authorize
  skip_before_filter :not_api_access

  @@error_type =  {
    :no_token=>1,# 没有token
    :invalid_token=>2,# 非法token
    :token_expires=>3,# token过期
    :token_limit=>4,# token超出限制
    :no_action=>5,# 不存在此API
    :no_param=>6, # 参数不足
    :invalid_result=>7
  }

  # API入口
  def entry
    api = params[:api]
    act = params[:act]
    @result = {:succeed=>false}
    
    if !params[:token].present?
      @result[:error] = @@error_type[:no_token]
      @result[:error_info] = "参数不足"
    
    elsif !(token = Token.find_by_value(params[:token]))
      @result[:error] = @@error_type[:invalid_token]
      @result[:error_info] = "不合法的存取标识"
    
    elsif Time.now - token.updated_at > 3600*24
      @result[:error] = @@error_type[:token_expires]
      @result[:error_info] = "存取标识过期了"
    
    elsif token.count > 100
      @result[:error] = @@error_type[:token_limit]
      @result[:error_info] = "存取过于频繁"
    
    elsif !["post"].include?(api)
      @result[:error] = @@error_type[:no_action]
      @result[:error_info] = "未提供该API"
    else
      current_user = User.find(token.user_id)
      eval "#{api}('#{act}')"
    end
    render :json=>@result
  end

  private
  # 脏！！待重构
  def post(act)
    case act
    when 'get'
      if(params[:id].present?)
        @result[:post] = Post.find(params[:id])
        if(@result[:post].nil?)
          @result[:error] = @@error_type[:invalid_result]
          @result[:error_info] = "结果为空"
        else
          @result[:succeed] = true
        end 
      else
        @result[:error] = @@error_type[:no_param]
        @result[:error_info] = "参数不足"
      end
    when 'random'
      id = Post.rand_id
      @result[:post] = Post.find(id)
      @result[:succeed] = true

    when 'next','like','dislike'
      v = {'next'=>0,'like'=>1,'dislike'=>-1}
      id = params[:id]
      unless params[:act].nil? || @@evaluate[params[:act]].nil?
        
        evaluate = Evaluate.where({:user_id=>current_user.id, :post_id=>id}).first_or_create
        unless !evaluate.value.nil? && evaluate.value.to_i == v[act]
          evaluate.value = v[act]
          evaluate.save
        end
        # 更新文章阅读数
        attribute = (act=="next" ? "neutral": act)
        Post.increment_counter(attribute.to_sym,id)
      end
      id = Post.rand_id
      @result[:post] = Post.find(id)
      @result[:succeed] = true
    else
      @result[:error] = @@error_type[:no_action]
      @result[:error_info] = "未提供该API"
    end
  end
end
