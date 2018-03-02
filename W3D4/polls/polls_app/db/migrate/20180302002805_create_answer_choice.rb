class CreateAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.text :text
      t.integer :question_id
      t.timestamps
    end
  end
end
