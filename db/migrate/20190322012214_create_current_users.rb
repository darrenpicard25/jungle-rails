class CreateCurrentUsers < ActiveRecord::Migration
  def change
    create_table :current_users do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps null: false
    end
  end
end
