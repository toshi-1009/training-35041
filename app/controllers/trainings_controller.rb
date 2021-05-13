class TrainingsController < ApplicationController

def index
  @trainings = Training.all.page(params[:page]).per(5)
end

def new
  @training = Training.new
end

def create
  @trainings = Training.new(training_params)
  if @trainings.save
    redirect_to root_path 
  else
    render :new
  end 
end

def show
  @training = Training.find(params[:id])
end

def edit
  
end

def update
  
end




private
def training_params
  params.require(:training).permit(:date, :training_menu, :category_id,:comment).merge(user_id: current_user.id)
end
end