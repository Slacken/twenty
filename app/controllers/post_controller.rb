class PostController < ApplicationController
  skip_before_filter :authorize, :only => [:index,:show,:actions]
  helper_method :short_url

  #这是默认的首页
  def index
    id = Post.rand_id
    begin
      @empty = false
      @post = Post.find(id)
    rescue ActiveRecord::RecordNotFound
      @empty = true
    end
    @title = @post.title
    cookies[:pid] = id
    render :show,:status=>404
  end

  # 显示文章页面
  def show
    id = params[:id]
    begin
      @post = Post.find(id)
      @title = @post.title
      cookies[:pid] = id
    rescue ActiveRecord::RecordNotFound
      @empty = true
      @title = "Not found."
    end
  end

  @@evaluate = {"like"=>1,"dislike"=>-1,"next"=>0}

  # 对文章进行操作
  def actions
    id = params[:id]
    unless params[:act].nil? || @@evaluate[params[:act]].nil?
      if logined?
        evaluate = Evaluate.where({:user_id=>user_id, :post_id=>id}).first_or_create
        unless !evaluate.value.nil? && evaluate.value.to_i == @@evaluate[params[:act]]
          evaluate.value = @@evaluate[params[:act]]
          evaluate.save
          # 更新user的阅读数

        end
      end
      # 更新文章阅读数
      attribute = (params[:act]=="next" ? "neutral": params[:act])
      Post.increment_counter(attribute.to_sym,id)
    end
    redirect_to post_path(Post.rand_id)
  end

  private
    def short_url(url)
      url[/^(http|https|ftp):\/\//i] = ''
      url.length > 35 ? url[0..32]+'...' : url
    end

end
