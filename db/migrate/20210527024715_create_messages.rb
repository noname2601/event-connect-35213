class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :text, null:false
      t.references :performer, foreign_key: true
      t.references :introduction, foreign_key: true
      t.timestamps
    end
  end
end
