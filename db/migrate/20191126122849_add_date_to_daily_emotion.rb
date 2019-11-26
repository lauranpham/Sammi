class AddDateToDailyEmotion < ActiveRecord::Migration[5.2]
  def change
    add_column :daily_emotions, :date, :date
  end
end
