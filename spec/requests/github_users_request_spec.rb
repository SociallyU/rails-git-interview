require 'rails_helper'

RSpec.describe "GithubUsers", type: :request do
  describe '#index' do

    context 'sanity check' do
      it 'renders the index page' do
        get '/github_users', params: {}
        expect(response).to have_http_status(:ok)
      end
    end

    let!(:present_user) { create(:github_user) }

    context 'when user is found' do
      it 'does not make an external call' do
        get '/github_users', params: { github_name: present_user.name}
        expect(GithubUser.count).to eq(1)
      end
    end

    context 'when user is not found in the db' do
      it 'creates the user' do
        expect(GithubUser.last.name).to eq(present_user.name)

        get '/github_users', params: { github_name: 'tallkeith'}
        expect(GithubUser.last.repo_count).to eq(70)
      end
    end
  end
end
