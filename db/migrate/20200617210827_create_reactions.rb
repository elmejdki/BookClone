class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :post, null: false, foreign_key: true, index: true
      t.boolean :like, default: false
      t.boolean :dislike, default: false

      t.timestamps
    end
  end
end
