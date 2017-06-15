class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  create_table :rides do |t|
    t.references :user
    t.references :attraction
  end
end
