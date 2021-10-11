class InquiriesController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_later if @inquiry.email.present?
      flash[:notice] = '送信しました。'
      redirect_to root_path
    else
      flash[:alert] = "送信に失敗しました"
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
