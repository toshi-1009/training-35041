class TrainingsController < ApplicationController

def index
  get_week
  @training = Training.new
end

def new
  @training = Training.new
end

def create
  # binding.pry
  Training.create(training_params)
  redirect_to action: :index
end

def show
  @training = Training.find
end

def edit
  
end

def update
  
end




private
def training_params
  params.require(:training).permit(:date, :training_menu, :category_id, :point,:evaluation).merge(user_id: current_user.id)
end

def get_week

  wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']
  
  # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
  @todays_date = Date.today
  # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

  @week_days = []

  plans = Training.where(date: @todays_date..@todays_date + 6)

  7.times do |x|
    today_plans = []
    plans.each do |plan|
      today_plans.push(plan.category.name, plan.training_menu, plan.point, plan.evaluation) if plan.date == @todays_date + x
    end


    wday_num = Date.today.wday + x

    if wday_num >= 7

    wday_num = wday_num -7

    end


    days = { month: (@todays_date + x).month, date: (@todays_date+x).day, plans: today_plans, wday: wdays[wday_num] } 

    @week_days.push(days)
  end

end
end




