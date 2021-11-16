class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @new_food = current_user.foods.new food_params

    if @new_food.save
      redirect_to foods_path, notice: 'Food successfully created!'
    else
      render :new
    end
  end

  def destroy
    food.destroy
    redirect_to foods_path, notice: 'Food deleted!'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
