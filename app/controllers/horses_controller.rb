class HorsesController < ApplicationController
  before_action :authenticate_user!

  def index
    @horses = current_user.horses
  end

  def show
    @horse = current_user.horses.find(params[:id])
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
    @horse = current_user.horses.find(params[:id])
  end

  def update
    @horse = current_user.horses.find(params[:id])
    if @horse.update(horse_params)
      redirect_to horse_path(@horse), notice: "馬の情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def horse_params
    params.require(:horse).permit(:name, :color_id, :personality, :memo)
  end
end
