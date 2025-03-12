class AddGithubFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :github_url, :string
    add_column :users, :username, :string
    add_column :users, :image, :string
  end
end
