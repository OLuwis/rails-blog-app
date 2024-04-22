class AddUserToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :user, type: :uuid, foreign_key: true
  end
end
