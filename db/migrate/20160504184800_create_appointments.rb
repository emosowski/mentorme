class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :mentor_phase
      t.integer :mentor_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
