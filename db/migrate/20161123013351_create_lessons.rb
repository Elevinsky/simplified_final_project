class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :trainer_id
      t.integer :student_id
      t.datetime :lesson_time
      t.boolean :checked_in

      t.timestamps

    end
  end
end
