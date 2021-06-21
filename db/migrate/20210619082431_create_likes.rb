class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :performer, foreign_key: true
      t.references :introduction, foreign_key: true

      t.timestamps
      t.index [:performer_id, :introduction_id], unique: true
    end
  end
end
