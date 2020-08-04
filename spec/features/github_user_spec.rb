require "rails_helper"

RSpec.describe "viewing a github user" do
  it "shows their github information" do
    with_github_user

    visit github_users_path
    fill_in "Github User", with: "fake-user"
    click_on "Find"

    expect(page).to have_content("Test User")
    expect(page).to have_content("test@example.com")
    expect(page).to have_content("Repo count: 4")
  end

  def with_github_user
    github_user = instance_double(
      GithubUser,
      username: "fake-user",
      name: "Test User",
      email: "test@example.com",
      repo_count: 4
    )
    expect(GithubUser).to receive(:find_or_create).and_return(github_user)
  end
end
