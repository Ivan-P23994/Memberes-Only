class AddTitleToTweeets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweeets, :title, :text
  end
end
