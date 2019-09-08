# creates a users table with columns for name, email and pw 

class Createusers < ActiveRecord::Migration
  require_relative './config/environment' 
   
   
   def change
     create_table :users do |t|
       t.string :name
       t.string :email
       t.string :password
     end
   end
 end