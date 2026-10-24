class InstructorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_instructor, only: [ :show, :edit, :update, :destroy ]

  def index
    @instructors = current_user.instructors
  end

  def show
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = current_user.instructors.build(instructor_params)
    if @instructor.save
      redirect_to instructor_path(@instructor), notice: "講師を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor), notice: "講師の情報を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @instructor.destroy
    redirect_to instructors_path, notice: "講師を削除しました", status: :see_other
  end

  private

  def set_instructor
    @instructor = current_user.instructors.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :feature, :memo)
  end
end
