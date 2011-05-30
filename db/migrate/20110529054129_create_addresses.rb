class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.references :user

      t.timestamps
    end

    # sample users with addresses

    user = User.first
    user.create_address(:country=>"USA",:city => "NY")
    user = User.last
    user.create_address(:country=>"Canada",:city => "AB")
  end

  def self.down
    drop_table :addresses
  end
end

