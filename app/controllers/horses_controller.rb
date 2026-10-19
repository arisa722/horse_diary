class HorsesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    @horse = Horse.new
  end

  def edit
  end
end
