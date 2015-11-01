class AddBirthplaceAndDeathplace < ActiveRecord::Migration
  def self.up
  	change_table :people do |t|
      t.string :birthplace
      t.string :deathplace
    end
  end
  def self.down
  	remove_column :people, :birthplace
  	remove_column :people, :deathplace
  end

end
