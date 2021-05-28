class CreateIntroductions < ActiveRecord::Migration[6.0]
  def change
    create_table :introductions do |t|
      t.string :skill,           null: false
      t.text :description,       null: false
      t.integer :day_price,      null: false
      t.integer :performer_id,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
