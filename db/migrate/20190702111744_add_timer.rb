class AddTimer < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time, :integer
  end
end
