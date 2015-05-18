class Article < ActiveRecord::Base
  belongs_to :category

  def create_edit_link
    ('a'..'z').to_a.sample(10).join('').succ
  end
end
