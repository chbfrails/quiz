class AddLevelToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :test_level, :integer
  end
end
