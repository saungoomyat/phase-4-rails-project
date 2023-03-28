class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  
  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.create(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find_by(params[:id])
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    head :no_content
  end

  private

  def post_params
    params.permit(:content)
  end

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end
end
