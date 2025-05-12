class CreateBabies < ActiveRecord::Migration[8.0]
  def change
    create_table :babies do |t|
      t.string :name
      t.date :birth_date
      t.string :gender
      t.float :weight_at_birth
      t.float :height_at_birth
      t.string :blood_type
      t.text :allergies
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
