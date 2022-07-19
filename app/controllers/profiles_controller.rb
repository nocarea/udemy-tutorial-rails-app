class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def show
    end
    
    def index
      @users = User.paginate(page: params[:page], per_page: 30)
    end
  end
  