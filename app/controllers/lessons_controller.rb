class LessonsController < ApplicationController

  before_action :authenticate_user!, except:[:show]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)

    @lesson.user = current_user

    if @lesson.save
      redirect_to @lesson
    else
      render :new
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :video)
  end
end
