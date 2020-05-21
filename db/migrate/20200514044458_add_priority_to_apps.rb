class AddPriorityToApps < ActiveRecord::Migration[6.0]
  def change
    add_column :apps, :priority, :string
  end
end
