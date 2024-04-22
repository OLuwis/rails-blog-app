class CreateTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :texts, id: :uuid do |t|

      t.timestamps
    end
  end
end
