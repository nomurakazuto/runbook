class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string user :content
      t.integer :favorite
      t.integer :finishment

      t.timestamps
    end
  end
end
