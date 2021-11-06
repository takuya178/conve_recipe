class SubsController < ApplicationController
  def index
    @q = Sub.ransack(params[:q])
    @subs = @q.result(distinct: true).all.page(params[:page]).per(15)
  end

  def show
    respond_to do |format|
      @sub = Sub.find(params[:id])
      format.html
      format.js
    end
  end
end
