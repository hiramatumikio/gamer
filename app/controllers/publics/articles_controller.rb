class Publics::ArticlesController < ApplicationController
  # before_action :authenticate_public!

  def index
    @articles = Article.page(params[:page]).per(12)
    @interest_new = Interest.new
    @all_ranks = Article.find(Interest.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
  end

  def show
    @article =Article.find(params[:id])
    @interest_new = Interest.new
  end

private

  def article_params
    params.require(:article).permit(:id, :title, :description, :image, :video_id)
  end

  def interest_params
    params.require(:interest).permit(:id, :article_id, :public_id)
  end
  
end