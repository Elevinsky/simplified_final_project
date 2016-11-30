class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :trainer_id
      t.datetime :lesson_time
      t.integer :student_id

      t.timestamps

    end
  end
end
