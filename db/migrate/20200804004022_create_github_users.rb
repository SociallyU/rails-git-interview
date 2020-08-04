class CreateGithubUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :github_users do |t|
      t.string :username, index: { unique: true }, null: false
      t.string :name
      t.string :email
      t.integer :repo_count
      t.timestamps
    end
  end
end
