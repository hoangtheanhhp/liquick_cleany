class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :address
      t.string :avatar, null: true
      t.time :worktime_start
      t.time :worktime_end
      t.integer :cost
      t.datetime :activated_at
      t.timestamps
    end
    add_index :partners, :email, unique: true
  end
end
