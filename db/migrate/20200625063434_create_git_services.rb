class CreateGitServices < ActiveRecord::Migration[5.2]
  def change
    create_table :git_services do |t|

      t.timestamps
    end
  end
end
