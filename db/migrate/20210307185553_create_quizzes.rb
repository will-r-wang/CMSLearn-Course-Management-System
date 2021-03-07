class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.datetime :time_opened
      t.datetime :time_closed
      t.time :alloted_time
      t.string :type

      t.timestamps
    end
  end
end
