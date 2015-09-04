class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :lesson, index: true, foreign_key: true
      t.string :name
      t.text :body

      t.timestamps null: false
    end
  end
end
