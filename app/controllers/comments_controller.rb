class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    @prototype = Prototype.find(params[:prototype_id])
    if @comment.save
      redirect_to prototype_path(@prototype)
    else
      @comment = Comment.new(comment_params)
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
