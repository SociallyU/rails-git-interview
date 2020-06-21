FactoryBot.define do
  factory :github_user do
    name { 'Foop' }
    email { 'foop@tester.com' }
    repo_count { rand(0..100) }
  end
end
