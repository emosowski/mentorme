class CreateAppointmentTopics < ActiveRecord::Migration
  def change
    create_table :appointment_topics do |t|
      t.integer :appointment_id
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
