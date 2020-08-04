class GithubUser < ApplicationRecord
  def self.find_or_create(username)
    where(username: username).first_or_create do |user|
      response = Faraday.get("https://api.github.com/users/#{username}", {}, { "Accept" => "application/vnd.github.v3+json" })
      response_body = JSON.parse(response.body).with_indifferent_access
      user.name = response_body[:name]
      user.repo_count = response_body[:public_repos]
      user.email = response_body[:email]
    end
  end
end
