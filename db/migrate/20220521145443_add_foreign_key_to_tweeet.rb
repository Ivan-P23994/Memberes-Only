class AddForeignKeyToTweeet < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tweeets, :users
  end
end
