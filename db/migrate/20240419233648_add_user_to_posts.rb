class AddUserToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, type: :uuid, foreign_key: true
  end
end
