class GoalsController < ApplicationController

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      redirect_to user_goals_url(@goal.user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def index
    @goals = current_user.goals
    render :index
  end

  def show
    @goal = Goal.find(params[:id])
    render :show
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_goals_url(@goal.user)
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :body)
  end
end
