class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
