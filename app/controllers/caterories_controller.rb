class CateroriesController < ApplicationController
  def index
    @categories = Caterory.all
  end

  def show
    @category = Caterory.find_by(id: params[:id])
  end

  def new
    @category = Caterory.new
  end

  def create
    @category = Caterory.new(category_params)
    if @category.save
      flash[:success] = t("flash.success_created")
      redirect_to @category
    else
      flash.now[:danger] = t("flash.create_failed")
      render :new
    end
  end

  private

  def category_params
    params.require(:caterory).permit(:name)
  end
end
