class AddLessonCountToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :lessons_count, :integer
  end
end
