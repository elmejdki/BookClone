class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.integer :rate

      t.timestamps
    end
  end
end
