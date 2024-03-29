class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end
    
    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            flash.notice = "Created new Category"
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
