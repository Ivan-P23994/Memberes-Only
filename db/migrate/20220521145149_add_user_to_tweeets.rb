class AddUserToTweeets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweeets, :user
  end
end
