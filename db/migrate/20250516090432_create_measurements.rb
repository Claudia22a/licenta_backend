class CreateMeasurements < ActiveRecord::Migration[8.0]
  def change
    create_table :measurements do |t|
      t.references :baby, null: false, foreign_key: true
      t.decimal :weight
      t.decimal :height
      t.decimal :head_circumference
      t.text :notes

      t.timestamps
    end
  end
end
