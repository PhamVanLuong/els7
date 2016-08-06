class CateroriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Caterory.all
  end

  def show
    @category = Caterory.find_by(id: params[:id])
    @words = @category.words.paginate page: params[:page],
      per_page: Settings.words_per_page
  end
end
