class CreateAsanas < ActiveRecord::Migration
  def change
    create_table :asanas do |t|
      t.string :asana_name
      t.string :asana_type
      t.string :target_general
      t.string :target_specific
      t.string :difficulty
      t.integer :duration

      t.timestamps null: false
    end
  end
end
