class TrainingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

def index
  @trainings = Training.all.page(params[:page]).per(5).order("created_at DESC")
  @targets = Target.all.order(updated_at: :desc).limit(1)
end

def new
  @training = Training.new
end

def create
  @training = Training.new(training_params)
  if @training.save
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
  if @training.update(training_params)
    redirect_to training_path 
  else
    render :edit
  end
end

def destroy
  training = Training.find(params[:id])
  training.destroy
  redirect_to root_path
end




private
def training_params
  params.require(:training).permit(:date, :training_menu, :category_id, :comment).merge(user_id: current_user.id)
end

def set_training
  @training = Training.find(params[:id])
end

def contributor_confirmation
  redirect_to root_path unless current_user.id == @training.user_id
end

end