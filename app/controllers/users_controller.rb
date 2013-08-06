class UsersController < ApplicationController

  skip_before_filter :authorize #, :only=>[:new,:create,:show]
  skip_before_filter :verify_authenticity_token, :only=>:update

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.select("posts.id,posts.title").where("value = ?",1).order("evaluates.id desc").limit(50).all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  
  # GET /users/new
  # GET /users/new.json
  def new
    only_for_unlogined
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end
  
  # POST /users
  # POST /users.json
  def create
    only_for_unlogined
    @user = User.new(params[:user])
    @user.name = @user.email.split("@").first
    @user.token = Token.new({:count=>0,:value=>@user.new_token})
    respond_to do |format|
      if @user.save
        self.current_user = @user
        save_state
        format.html { redirect_to(root_url, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /setting.json
  def update
    succeed = false
    if params[:name].present?
      @user = current_user
      @user.name = params[:name]
      succeed = @user.save
    elsif(params[:url].present?)
      rss = Rss.new({:url => params[:url], :home =>(params[:home].present? ? params[:home] : params[:url])})
      succeed = rss.save
    end
    respond_to do |format|
      format.json { render json: {:succeed=>succeed} }
    end
  end

  def destroy
  end

end
