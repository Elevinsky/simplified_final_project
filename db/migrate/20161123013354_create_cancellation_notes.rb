class CreateCancellationNotes < ActiveRecord::Migration
  def change
    create_table :cancellation_notes do |t|
      t.integer :lesson_id
      t.string :body

      t.timestamps

    end
  end
end
