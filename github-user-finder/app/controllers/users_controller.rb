class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        base_url = "https://api.github.com/users/"
        user_data = redirect_to (base_url + user_params[:name])
        # @user = User.new(user_params)
        # if @user.save 
        #     redirect_to user_path(@user)
        # end
    end

    def show 
        @user = User.find(params[:id])
    end

    private

    def user_params 
        params.require(:user).permit(:name)
    end

end
