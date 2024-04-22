class CreatePostTags < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tags, id: :uuid do |t|
      t.references :post, type: :uuid, foreign_key: true
      t.references :tag, type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
