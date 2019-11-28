class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer 'student_id', null: false
      t.integer 'teacher_id', null: false
      t.date :date
      t.string :comment
      t.timestamps
    end

    add_index :appointments, :student_id
    add_index :appointments, :teacher_id
    add_index :appointments, [:student_id, :teacher_id]
  end
end
