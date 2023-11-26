class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :quarters, default: 3
      t.integer :sides, default: 6
      t.integer :overall_points, default: 0

      t.timestamps
    end
  end
end
