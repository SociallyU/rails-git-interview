class GitServicesController < ApplicationController

    def index
    end

    def show
        @git_user = GitService.get_git_info(params[:id])
    end

    def create
        redirect_to action: "show", id: params[:git_service][:github_username]
    end
end