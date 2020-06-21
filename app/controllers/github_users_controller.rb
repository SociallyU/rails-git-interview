class GithubUsersController < ApplicationController

  def index
    set_github_user ? @github_user : create
  end

  def create
    if params[:github_name]
      github_name = params[:github_name]
      response = HTTParty.get("http://api.github.com/users/#{github_name}")

      @github_user = GithubUser.create!(
        name: response['login'],
        email: response['email'],
        repo_count: response['public_repos']
      )
    end
  end

  private

  def set_github_user
    @github_user = GithubUser.find_by(name: params[:github_name])
  end

  def github_user_params
    params.permit(:github_name)
  end
end
