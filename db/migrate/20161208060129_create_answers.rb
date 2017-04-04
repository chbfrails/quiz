class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :name
      t.text :description
      t.boolean :correct
      t.timestamps
    end

    add_reference :answers, :question
  end
end
