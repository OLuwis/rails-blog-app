class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :body
      t.references :post, null: false, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
