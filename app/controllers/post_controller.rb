class PostController < ApplicationController
  def initialize
    super
    @title = "Hello"
  end
  def index
    @title = "good"
  end

  def show
    id = params[:id]
  end
end
