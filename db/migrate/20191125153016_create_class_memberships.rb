class CreateClassMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :class_memberships do |t|
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
