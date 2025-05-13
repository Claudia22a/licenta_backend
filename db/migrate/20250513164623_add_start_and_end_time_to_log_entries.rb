class AddStartAndEndTimeToLogEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :log_entries, :start_time, :datetime
    add_column :log_entries, :end_time, :datetime
  end
end
