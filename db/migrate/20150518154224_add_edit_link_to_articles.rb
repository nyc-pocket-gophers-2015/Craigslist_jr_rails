class AddEditLinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :edit_link, :string
  end
end
