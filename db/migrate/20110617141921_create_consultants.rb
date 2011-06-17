class CreateConsultants < ActiveRecord::Migration
  def self.up
    create_table :consultants do |t|
      t.string :first_name
      t.string :last_name
      t.integer :clinic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consultants
  end
end
