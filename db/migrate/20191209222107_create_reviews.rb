class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :review_text
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
