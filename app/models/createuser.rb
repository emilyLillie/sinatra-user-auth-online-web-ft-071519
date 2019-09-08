class CreateUser < ActiveRecord::Migration[4.2]
require_relative './config/environment'

  def change 
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
    end 
  end

end 
    