class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]

  def index
    @targets = Target.all
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to root_path 
    else
      render :new
    end 
  end
  
  def show
  end

  def edit
  end

  def update
    if @target.update(target_params)
      redirect_to root_path 
    else
      render :edit
    end
  end

  def destroy
    training = Target.find(params[:id])
    training.destroy
    redirect_to root_path
  end

  private
  def target_params
    params.require(:target).permit(:target, :timing, :activity, :reward).merge(user_id: current_user.id)
  end


   def set_target
    # binding.pry
    @target = Target.find(params[:id])
   end
end
