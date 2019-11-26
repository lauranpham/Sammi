class CreateEmotions < ActiveRecord::Migration[5.2]
  def change
    create_table :emotions do |t|
      t.integer :rating, default: 0, null: false

      t.timestamps
    end
  end
end
