class CreateLogEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :log_entries do |t|
      t.references :baby, null: false, foreign_key: true
      t.string :entry_type, null: false
      t.datetime :logged_at, null: false, default: -> { 'NOW()' }
      t.text :notes

      t.integer :duration
      t.decimal :amount, precision: 6, scale: 2
      t.string :unit
      t.string :location
      t.string :mood
      t.integer :diaper_type
      t.integer :feeding_type
      t.integer :sleep_type
      t.integer :walk_type
      t.integer :symptom_type
      t.integer :tag_type
      t.string :other_diaper_type
      t.string :other_feeding_type
      t.string :other_sleep_type
      t.string :other_walk_type
      t.string :other_symptom_type
      t.string :other_tag_type

      t.timestamps
    end
  end
end
