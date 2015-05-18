class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :title, null: false
      t.text     :body, null: false
      t.string   :price, null: false
      t.string   :email, null: false
      t.references :category, null: false

      t.timestamps null: false
    end
  end
end
