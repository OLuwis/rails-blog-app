class CreateTexts < ActiveRecord::Migration[7.1]
  def change
    create_table :texts do |t|

      t.timestamps
    end
  end
end
