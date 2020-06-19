class UpdateUserTable < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.string :fullname,           null: false, default: ''
      t.text :bio
      t.string :profession
      t.string :city
      t.string :gender,             null: false, default: "male"
    end
  end
end
