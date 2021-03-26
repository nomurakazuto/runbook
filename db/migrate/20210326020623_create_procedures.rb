class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.string :content
      t.boolean :finishment, default: false, null: false
      t.date :deadline
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
