class CreateTask s < ActiveRecord::Migration[5.2]
  def change
    create_table :task s do |t|
      t.references content :user
      t.integer :favorite
      t.integer :finishment

      t.timestamps
    end
  end
end
