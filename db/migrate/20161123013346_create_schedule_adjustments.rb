class CreateScheduleAdjustments < ActiveRecord::Migration
  def change
    create_table :schedule_adjustments do |t|
      t.integer :trainer_id
      t.datetime :adjusted_start
      t.datetime :adjusted_end

      t.timestamps

    end
  end
end
