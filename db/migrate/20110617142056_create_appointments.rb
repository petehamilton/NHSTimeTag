class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.datetime :time
      t.integer :patient_id
      t.integer :clinic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
