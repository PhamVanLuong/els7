class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = t("flash.success_word")
      render :index
    else
      render :new
    end
  end

  private

  def word_params
    params.require(:word).permit(:learning_word, :meaning)
  end
end
