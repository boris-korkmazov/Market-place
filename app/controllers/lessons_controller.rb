class LessonsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :likes]
  before_action :get_lesson, only:[:show, :likes]
  before_action :not_owner!, only: :likes

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
    @comment = @lesson.comments.build
  end

  def likes
    @lesson.likes = (params[:direct] == 'up') ?  @lesson.likes + 1 : @lesson.likes - 1
    @lesson.save
    respond_to do |format|
      format.json {render json: {count: @lesson.likes}}
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :video)
  end

  def get_lesson
    @lesson = Lesson.find(params[:id])
  end

  def not_owner!
    if current_user
      @lesson.user == current_user ? false : true
    else
      true
    end
  end
end
