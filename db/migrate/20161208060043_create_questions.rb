class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :name
      t.text :description
      t.integer :qtype

      t.timestamps
    end
  end
end
