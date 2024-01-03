class FoodsController < ApplicationController
  def new
    @food_form = Food.new
  end

  def create
  end
end
