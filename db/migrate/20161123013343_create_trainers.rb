class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :tues_start_hour
      t.integer :tues_start_min
      t.string :tues_start_am_pm
      t.integer :wed_start_hour
      t.integer :wed_start_min
      t.string :wed_start_am_pm
      t.integer :thur_start_hour
      t.integer :thur_start_min
      t.string :thur_start_am_pm
      t.integer :fri_start_hour
      t.integer :fri_start_min
      t.string :fri_start_am_pm
      t.integer :sat_start_hour
      t.integer :sat_start_min
      t.string :sat_start_am_pm
      t.integer :sun_start_hour
      t.integer :sun_start_min
      t.string :sun_start_am_pm
      t.integer :tues_end_hour
      t.integer :tues_end_min
      t.string :tues_end_am_pm
      t.integer :wed_end_hour
      t.integer :wed_end_min
      t.string :wed_end_am_pm
      t.integer :thur_end_hour
      t.integer :thur_end_min
      t.string :thur_end_am_pm
      t.integer :fri_end_hour
      t.integer :fri_end_min
      t.string :fri_end_am_pm
      t.integer :sat_end_hour
      t.integer :sat_end_min
      t.string :sat_end_am_pm
      t.integer :sun_end_hour
      t.integer :sun_end_min
      t.string :sun_end_am_pm

      t.timestamps

    end
  end
end
