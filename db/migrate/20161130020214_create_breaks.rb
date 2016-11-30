class CreateBreaks < ActiveRecord::Migration
  def change
    create_table :breaks do |t|
      t.integer :trainer_id
      t.datetime :start
      t.datetime :end

      t.timestamps

    end
  end
end
