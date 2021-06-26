class CreateIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :introductions do |t|
      t.integer :genre_id, null: false
      t.text :description,       null: false
      t.string :twitter_id, null: false
      t.integer :performer_id,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
