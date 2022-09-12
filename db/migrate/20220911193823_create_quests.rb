class CreateQuests < ActiveRecord::Migration[7.0]
  def change
    create_table :quests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
