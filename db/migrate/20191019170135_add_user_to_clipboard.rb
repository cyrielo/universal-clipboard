class AddUserToClipboard < ActiveRecord::Migration[5.2]
  def change
    add_reference :clipboards, :user, foreign_key: true
  end
end
