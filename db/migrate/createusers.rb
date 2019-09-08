# creates a users table with columns for name, email and pw 
#look in schema, that's where the table was actually made 

class Createusers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end
  end
end