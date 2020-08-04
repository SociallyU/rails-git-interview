class GithubUsersController < ApplicationController
  def index
    @github_user = GithubUser.find_or_create(params[:username]) if params[:username].present?
  end
end
