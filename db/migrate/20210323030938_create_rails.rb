class CreateRails < ActiveRecord::Migration[5.2]
  def change
    create_table :rails do |t|
      t.string :g
      t.string :model
      t.string :Task
      t.string　user :　content
      t.integer　 :　favorite
      t.integer :finishment

      t.timestamps
    end
  end
end
