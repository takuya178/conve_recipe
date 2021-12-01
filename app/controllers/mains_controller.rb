class MainsController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :create] 
  
  include Pagy::Backend

  def index
    @q = Main.ransack(params[:q])
    @pagy, @mains = pagy(@q.result(distinct: true).all, items: 14)
  end

  def show
    @main = Main.find(params[:id])
  end

  def new
    @main_sub_form = MainSubForm.new
    @mains = Main.find_by(name: params[:name])
  end

  def create
    @main_sub_form = MainSubForm.new(main_sub_form_params)
    main_data = Main.find_or_initialize_by(name: main_sub_form_params[:name])

    binding.pry
    if main_data.new_record?
      if @main_sub_form.save
        redirect_to new_main_path, success: '組み合わせを追加しました'
      else
        flash.now[:danger] = '組み合わせの追加に失敗しました'
        render :new
      end
    else
      main_data.subs << Sub.create(image: main_sub_form_params[:subs_attributes][:image], name: main_sub_form_params[:subs_attributes][:name], calorie: main_sub_form_params[:subs_attributes][:calorie], sugar: main_sub_form_params[:subs_attributes][:sugar], lipid: main_sub_form_params[:subs_attributes][:lipid], salt: main_sub_form_params[:subs_attributes][:salt], stores: main_sub_form_params[:subs_attributes][:stores])

      redirect_to new_main_path, success: "#{main_data.name}に新しい組み合わせを追加しました"
    end
  end

  private

  def main_sub_form_params
    params.require(:main_sub_form).permit(
      :name,
      :image,
      :calorie,
      :sugar,
      :lipid,
      :salt,
      :genre,
      :stores,
      subs_attributes:[:name, :image, :calorie, :sugar, :lipid, :salt, :stores])
  end

  def set_s3_direct_post
    require 'aws-sdk-s3'
    Aws.config.update({
      region: Rails.application.credentials.dig(:aws, :region),
      credentials: Aws::Credentials.new( Rails.application.credentials.dig(:aws, :access_key_id), Rails.application.credentials.dig(:aws, :secret_access_key))
    })
    @s3_direct_post = Aws::S3::Resource.new.bucket(Rails.application.credentials.dig(:aws, :bucket)).presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end