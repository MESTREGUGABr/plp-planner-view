class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :user do |t|
      t.string :name
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
