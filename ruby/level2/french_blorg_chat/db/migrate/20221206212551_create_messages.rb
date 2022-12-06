class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :author
      t.text :content
      t.boolean :is_french

      t.timestamps
    end
  end
end
