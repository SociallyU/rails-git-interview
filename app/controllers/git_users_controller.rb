class GitUsersController < ApplicationController

    def index
    end

    def show
        @git_user = GitUser.get_git_info(params[:id])
    end

    def create
        redirect_to action: "show", id: params[:git_user][:github_username]
    end
end