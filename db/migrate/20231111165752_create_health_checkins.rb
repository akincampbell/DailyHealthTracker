class CreateHealthCheckins < ActiveRecord::Migration[7.0]
  def change
    create_table :health_checkins do |t|
      t.boolean :water
      t.boolean :grain
      t.boolean :protein
      t.boolean :fruit
      t.boolean :vegetable
      t.integer :user_id
      t.float :weight
      t.boolean :exercise

      t.timestamps
    end
  end
end
