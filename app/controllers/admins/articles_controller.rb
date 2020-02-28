class Admins::ArticlesController < ApplicationController
   before_action :authenticate_admin!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = '記事が作成されました。'
      redirect_to admins_articles_path
    else
      flash.now[:error] = '記事を作成できませんでした。'
      render new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to admins_articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
       flash[:notice] = "記事を削除しました。"
       redirect_to admins_articles_path
    else
      render :index
    end
  end

private

  def article_params
    params.require(:article).permit(:id, :title, :description, :image, :video_id)
  end
end
