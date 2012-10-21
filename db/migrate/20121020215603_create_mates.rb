class CreateMates < ActiveRecord::Migration
  def change
    create_table :mates do |t|
      t.string :name
      t.string :location
      t.string :avatar_url
      t.string :address
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
