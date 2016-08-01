class Admin::CateroriesController < ApplicationController
  before_action :logged_in_user
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Caterory.all
  end

  def show
    @words = @category.words.paginate page: params[:page],
      per_page: Settings.words_per_page
  end

  def new
    @category = Caterory.new
  end

  def edit
  end

  def create
    @category = Caterory.new(category_params)
    if @category.save
      flash[:success] = t(".create_success")
      redirect_to [:admin, @category]
    else
      flash.now[:danger] = t(".create_fail")
      render :new
    end
  end

  def update
    if @category.update_attributes(word_params)
      flash[:success] = t(".update_success")
      redirect_to [:admin, @category]
    else
      flash.now[:danger] = t(".update_fail")
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t(".destroy")
    else
      flash[:danger] = t(".destroy_fail")
    end
    redirect_to admin_caterories_path
  end

  private

  def category_params
    params.require(:caterory).permit(:name)
  end

  def find_category
    @category = Caterory.find_by(id: params[:id])
  end
end
