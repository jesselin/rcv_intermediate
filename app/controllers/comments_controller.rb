class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save 
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    set_comment
  end

  def edit
    set_comment
  end

  def update
    set_comment

    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    if set_comment.destroy
      redirect_to comments_path, notice: 'Comment deleted.'
    else
      render action: 'index'
    end
  end

  private
    
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit([:author, :content, :product_id])
    end

end