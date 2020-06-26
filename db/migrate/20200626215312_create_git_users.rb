class CreateGitUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :git_users do |t|
      t.string :name
      t.string :email
      t.integer :public_repo_count
      t.string :username
    end
  end
end
