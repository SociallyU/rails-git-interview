require "rails_helper"

RSpec.describe GithubUser do
  describe ".find_or_create" do
    it "returns github user from database if present" do
      github_user = GithubUser.create!(username: "foo")

      result = GithubUser.find_or_create("foo")

      expect(result).to eq(github_user)
    end

    it "searches github for user if not present in database and saves it" do
      stub = stub_request(:get, %r{/users/foo})
        .to_return(
          status: 200,
          body: {
            name: "Test User",
            public_repos: 4,
            email: "test@example.com"
          }.to_json
        )

      result = GithubUser.find_or_create("foo")

      expect(result.username).to eq("foo")
      expect(result.name).to eq("Test User")
      expect(result.repo_count).to eq(4)
      expect(result.email).to eq("test@example.com")
      expect(GithubUser.find_by(username: "foo")).to be_present
      expect(stub).to have_been_requested
    end
  end
end
