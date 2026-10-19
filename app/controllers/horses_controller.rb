class HorsesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = current_user.horses.build(horse_params)
    if @horse.save
      redirect_to horse_path(@horse), notice: "馬を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :color_id, :personality, :memo)
  end
end
