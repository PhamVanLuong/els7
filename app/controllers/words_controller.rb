class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def show
    @word = Word.find_by(id: params[:id])
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = t("flash.success_created")
      redirect_to @word
    else
      flash.now[:danger] = t("flash.create_failed")
      render :new
    end
  end

  private

  def word_params
    params.require(:word).permit(:learning_word, :meaning)
  end
end
