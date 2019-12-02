class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer 'student_id', null: false
      t.integer 'teacher_id', null: false
      t.text :content
      t.timestamps
    end

    add_index :notes, :student_id
    add_index :notes, :teacher_id
    add_index :notes, [:student_id, :teacher_id]
  end
end
