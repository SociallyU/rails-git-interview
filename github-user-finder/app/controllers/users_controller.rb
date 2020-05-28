require 'net/http'

class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        base_url = "https://api.github.com/users/"
        uri = URI("https://api.github.com/users/" + user_params[:name])
        string = Net::HTTP.get(uri)
        json = JSON.parse(string)
        if json["message"] 
            flash.alert = json["message"]
            render :new
        end
        # user_data = {name: json["login"], email: json["email"], repo_count: json["public_repos"]}
        # byebug
       
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
