class GitUsersController < ApplicationController

    def show
        @git_user = GitUser.find(params[:id])
    end

    def create 
        @git_user = GitUser.find_by(username: git_username)
        if @git_user # checks for git_user in database
            redirect_to @git_user
        else # creates new git_user if not found
            @git_user = GitUser.get_git_info(git_username) 
            if @git_user
                redirect_to @git_user
            else
                redirect_to new_git_user_path #this should probably show that there is an error
            end
        end
    end

    def new
    end

    private

    def git_username
        params[:git_user][:github_username] ## can this be refactored to use require.permit strong params?
    end
end