class ArticlesController < ApplicationController
  include ApplicationHelper
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' Created!"
      message = Notification.article_created(current_user, @article)
      message.deliver_now
      redirect_to article_url(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash.notice = "Article '#{@article.title}' Updated!"
      redirect_to article_url(@article)
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Destroyed!"
    redirect_to articles_url
  end

  private 

  def article_params
    params.require(:article).permit(:body, :title)
  end
end
