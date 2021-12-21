class Admin::MainsController < Admin::BaseController
  before_action :set_main, only: %i[show edit update destroy]

  def index
    @q = Main.ransack(params[:q])
    @mains = @q.result.preload_main_image
  end

  def new
    @main = Main.new
  end

  def create
    @main = Main.new(main_params)

    if @main.save
      redirect_to new_admin_main_path, success: 'メイン料理を追加しました'
    else
      flash.now[:danger] = 'メイン料理の作成に失敗しました'
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @main.update(main_params)
      redirect_to admin_main_path(@main), success: '更新に成功しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @main.destroy!
    redirect_to admin_mains_path, success: '削除しました'
  end

  private

  def main_params
    params.require(:main).permit(:name, :image, :genre, :calorie, :sugar, :lipid, :salt)
  end

  def set_main
    @main = Main.find(params[:id])
  end
end
