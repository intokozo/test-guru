class AddLevelDefaultToTest < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, to: 0
  end
end
