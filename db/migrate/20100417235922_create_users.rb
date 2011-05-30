class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :password_hash
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end

    #create sample users
    User.create(:login => "Matthew", :password => "matt", :password_confirmation => "matt")
    User.create(:login => "Gregory", :password => "greg", :password_confirmation => "greg")
  end

  def self.down
    drop_table :users
  end
end

