class GithubUser < ApplicationRecord
  validates_presence_of :name, :repo_count
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },unless: lambda { self.email.blank? }
end
