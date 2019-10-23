class CreateAdminAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_admins do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :admin_admins, :email, unique: true
  end
end
