class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :birthdate
      t.string :birthplace
      t.string :deathdate
      t.string :deathplace
      t.text :story

      t.timestamps null: false
    end
  end
end
