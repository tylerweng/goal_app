class UserCommentsController < ApplicationController

  def new
    @user_comment = UserComment.new
    render :new
  end

  def create
    @user_comment = UserComment.new(comment_params)
    @user_comment.poster_id = current_user.id
    @user_comment.postee_id = params[:user_id]

    if @user_comment.save
      redirect_to "/users/#{params[:user_id]}"
    else
      flash.now[:errors] = @user_comment.errors.full_messages
      render :new
    end
  end

  private
  def comment_params
    params.require(:user_comment).permit(:body)
  end

end
