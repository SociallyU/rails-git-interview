require 'rails_helper'

RSpec.describe GithubUser, type: :model do
  describe 'sanity check' do
    let(:user) { create(:github_user) }
    it 'creates an object successfully' do
      expect(user).to be_valid
      expect(user).to be_persisted
    end
  end

  describe 'model validations' do
    context 'when model is missing' do
      let(:no_name) { build(:github_user, name: nil) }
      let(:no_email) { build(:github_user, email: nil) }
      let(:no_repo_count) { build(:github_user, repo_count: nil) }

      it 'name' do
        expect(no_name).to be_invalid
      end

      it 'email' do
        expect(no_email).to be_invalid
      end

      it 'repo_count' do
        expect(no_repo_count).to be_invalid
      end
    end

    context 'when model has invalid' do

      let(:invalid_email) { build(:github_user, email: 'blah') }

      it 'email' do
        expect(invalid_email).to be_invalid
      end
    end
  end
end
