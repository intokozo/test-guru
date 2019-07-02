class AddAuthorToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, index: true
    add_foreign_key :tests, :users, column: :author_id
  end
end
