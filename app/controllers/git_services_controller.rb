class GitServicesController < ApplicationController
    def show
        @git_user = GitService.get_git_info(params[:id])
    end
end