class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson, only: [ :show, :edit, :update, :destroy ]

  def index
    @lessons = current_user.lessons.order(date: :desc)
    if params[:horse_name].present?
      @lessons = @lessons.joins(:horse).where("horses.name LIKE ?", "%#{params[:horse_name]}%")
    end
  end

  def show
  end

  def new
    @lesson = Lesson.new(date: Date.today)
  end

  def create
    @lesson = current_user.lessons.build(lesson_params)
    if @lesson.save
      redirect_to lesson_path(@lesson), notice: "レッスンを記録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to lesson_path(@lesson), notice: "レッスン記録を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy
    redirect_to lessons_path, notice: "レッスン記録を削除しました。", status: :see_other
  end

  private

  def set_lesson
    @lesson = current_user.lessons.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:horse_id, :instructor_id, :date, :instruction, :impression, :next_goal, category_ids: [])
  end
end
