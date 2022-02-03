class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :like, null: false, foreign_key: { to_table: :memos }

      t.timestamps
    end
  end
end
