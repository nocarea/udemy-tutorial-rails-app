class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    
    def index
        @articles = Article.paginate(page: params[:page], per_page: 30)
    end

    def show
    end
    
    def edit
    end

    def update
        if @article.update(article_params)
            flash.notice = "Updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
    end
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = current_user
        byebug
        if @article.save
            flash.notice = "Created successfully"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :description)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end
