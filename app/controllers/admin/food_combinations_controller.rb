class Admin::FoodCombinationsController < Admin::BaseController
  before_action :set_food_combination, only: %i[show edit update destroy]

  def index
    @q = FoodCombination.ransack(params[:q])
    @foods = @q.result(distinct: true).preload(:main, :sub).preload_food_image
  end

  def edit; end

  def show; end

  def update
    if @food.update(food_combination_params)
      redirect_to admin_food_combinations_path(@food), success: '更新に成功しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @food.destroy!
    redirect_to admin_food_combinations_path, success: '組み合わせを削除しました'
  end

  private

  def food_combination_params
    params.require(:food_combination).permit(:main_id, :sub_id, :prices, :stores, :image)
  end

  def set_food_combination
    @food = FoodCombination.find(params[:id])
  end
end
