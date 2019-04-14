class CreateTestsUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :users do |t|
      t.index %i[user_id test_id], unique: true
      t.timestamps
      t.primary_key(:id)
    end
  end
end
