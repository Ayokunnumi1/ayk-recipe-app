class FoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def index
  @foods = current_user.foods.includes(:user)
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:success] = 'Food saved successfully'
      redirect_to foods_path
    else
      flash[:error] = 'Food Not Saved, try again later'
      puts @food.errors.full_messages
      render :new
    end
  end

  def destroy
  @food = current_user.foods.find(params[:id])
  @food.destroy
  redirect_to foods_path, notice: 'Food item was successfully deleted.'
  end

  private

  def food_params
  params.require(:food).permit(:name, :measurement_unit, :price)
  end

end
