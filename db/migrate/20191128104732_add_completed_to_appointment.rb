class AddCompletedToAppointment < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :completed, :boolean, default: false
  end
end
