class AddJournalsToHealthCheckin < ActiveRecord::Migration[7.0]
  def change
    add_column :health_checkins, :journal, :string
  end
end
