class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :favorite, default: false, null: false
      t.boolean :finishment, default: false, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
