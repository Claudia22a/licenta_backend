class AddTitleToLogEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :log_entries, :title, :string
  end
end
