class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.datetime :datetime
      t.integer :patient_id
      t.integer :doctor_id
      t.boolean :attending, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
