class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food_form = Food.new
  end

  def create
    @food_form_data = Food.new([:food_form_params])
    if @food_form_data.save
      flash[:success] = 'Food saved successfully'
      redirect_to foods_path
    else
      flash[:error] = 'Food Not Saved, try again later'
      render :new
    end
  end
end
