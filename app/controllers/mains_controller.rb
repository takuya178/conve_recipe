class MainsController < ApplicationController
  include Pagy::Backend

  def index
    @q = Main.ransack(params[:q])
    @pagy, @mains = pagy(@q.result(distinct: true).preload_main_image, items: 14)
  end

  def show
    @main = Main.find(params[:id])
  end

  def new
    @main_sub_form = MainSubForm.new
    @main_data = Main.find_by(name: params[:name])
  end

  def create
    @main_sub_form = MainSubForm.new(main_sub_form_params)
    main_initialize = Main.find_or_initialize_by(name: main_sub_form_params[:name])

    if main_initialize.new_record?
      if @main_sub_form.save
        redirect_to new_main_path, success: '組み合わせを追加しました'
      else
        flash.now[:danger] = '組み合わせの追加に失敗しました'
        render :new
      end
    else
      main_initialize.subs << Sub.create(image: main_sub_form_params[:subs_attributes][:image], name: main_sub_form_params[:subs_attributes][:name], calorie: main_sub_form_params[:subs_attributes][:calorie], sugar: main_sub_form_params[:subs_attributes][:sugar], lipid: main_sub_form_params[:subs_attributes][:lipid], salt: main_sub_form_params[:subs_attributes][:salt], stores: main_sub_form_params[:subs_attributes][:stores])

      redirect_to new_main_path, success: "#{main_initialize.name}に新しい組み合わせを追加しました"
    end
  end

  private

  def main_sub_form_params
    params.require(:main_sub_form).permit(:name, :image, :calorie, :sugar, :lipid, :salt, :genre, :stores, subs_attributes: %i[name image calorie sugar lipid salt stores])
  end
end
