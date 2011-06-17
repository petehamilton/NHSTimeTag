class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :contact_text
      t.boolean :contact_email
      t.boolean :contact_phonecall
      t.string :nhs_number

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
