require 'net/http'

class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        if @user = User.find_by(name: user_params[:name])
            redirect_to user_path(@user)
        else 
            json = find_github_user(user_params[:name])
            if json["message"] 
                flash.alert = json["message"]
                render :new
            else 
                user_data = {name: json["login"], email: json["email"], repo_count: json["public_repos"]}
                @user = User.new(user_data)
                if @user.save 
                    redirect_to user_path(@user)
                end
            end
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    private

    def user_params 
        params.require(:user).permit(:name)
    end

    def find_github_user(user_name)
        base_url = "https://api.github.com/users/"
        uri = URI("https://api.github.com/users/" + user_name)
        string = Net::HTTP.get(uri)
        JSON.parse(string)
    end

end
