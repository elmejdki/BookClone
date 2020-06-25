class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :rate, default: 5
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
