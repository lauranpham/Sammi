class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :room
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
