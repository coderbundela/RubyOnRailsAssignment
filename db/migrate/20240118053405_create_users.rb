class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :uuid, :null => false,index: true
      t.string :gender
      t.json :name
      t.json :location
      t.integer :age

      t.timestamps
    end
  end
end
